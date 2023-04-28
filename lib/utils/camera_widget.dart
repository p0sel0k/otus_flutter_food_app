import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:go_router/go_router.dart';
import 'package:hw2/features/comments/application/comments_service.dart';
import 'package:hw2/features/recipe/data/tflite_repository.dart';
import 'package:hw2/features/recipe/presentation/recipe_page/recipe_controller.dart';
import 'package:tflite_flutter_helper_plus/tflite_flutter_helper_plus.dart';
// import 'package:tflite_flutter_helper_plus/tflite_flutter_helper_plus.dart';

class CameraWidget extends ConsumerStatefulWidget {
  final int id;

  const CameraWidget({super.key, required this.id});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends ConsumerState<CameraWidget> {
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    final model = await Tflite.loadModel(
      model: tflite_model,
      labels: tflite_labels,
    );
    // await ref.read(tfliteRepositoryProvider).loadModel();
  }

  // @override
  // void dispose() {
  //   Tflite.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final commentsService = ref.read(commentsServiceProvider(widget.id));
    final cameraInitializer = ref
        .watch(recipeControllerProvider(widget.id).notifier)
        .cameraController;
    const color = Color.fromRGBO(22, 89, 50, 1);
    final width = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: cameraInitializer,
        builder: (context, snapshot) => snapshot.hasData
            // ? SafeArea(
            ? Scaffold(
                body: Stack(
                  children: [
                    CameraPreview(snapshot.data!),
                    Positioned(
                      bottom: 5,
                      left: width / 2 - 116,
                      child: Center(
                        child: InkWell(
                          onTap: () async {
                            commentsService.whenData((value) async {
                              value.addImage(
                                await takePicture(
                                  snapshot.data!,
                                ),
                              );
                            });
                            context.pop();
                          },
                          child: Container(
                            width: 232,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: color, width: 3),
                            ),
                            child: const Center(
                              child: Text(
                                'Сделать снимок',
                                style: TextStyle(
                                  color: color,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // ),
              )
            : const CircularProgressIndicator());
  }

  Future<Uint8List> takePicture(CameraController camera) async {
    final img = await camera.takePicture();
    final proccessor = ImageProcessorBuilder()
        .add(ResizeOp(224, 224, ResizeMethod.nearestneighbour))
        .build();
    var tensorImg = TensorImage.fromFile(File(img.path));
    tensorImg = proccessor.process(tensorImg);
    // ref.read(tfliteRepositoryProvider).runOnImage(img.path);
    print('///////////////////////// DETECTING...');
    // final detect = await Tflite.detectObjectOnImage(path: img.path);
    // final detect = await Tflite.runModelOnBinary(binary: tensorImg.image.getBytes(), asynch: false);
    runModelOnImageInIsolate(img.path);
    // print('///////////////////////// DETECT: $detect');
    return File(img.path).readAsBytes();
  }
}

Future<void> runModelOnImageInIsolate(String path) async {
  final receivePort = ReceivePort();
  await Isolate.spawn<SendPort>(_runModel, receivePort.sendPort);

  // final Completer completer = Completer<void>();

  receivePort.listen(
    (message) {
      if (message == 'loaded') {
        _runInference(path).then(
          (value) {
            // completer.complete();
            print('///////////////////////// DETECT: $value');
          },
        );
      }
    },
  );
}

Future<void> _runModel(SendPort sendPort) async {
  final result = await Tflite.loadModel(
    model: tflite_model,
    labels: tflite_labels,
  );
  if (result != null) sendPort.send('loaded');
}

Future<List<dynamic>> _runInference(String path) async {
  final result = await Tflite.runModelOnImage(
    path: path,
    numResults: 6,
    threshold: 0.05,
  );
  if (result == null) throw 'smth go wrong';
  return result;
}
