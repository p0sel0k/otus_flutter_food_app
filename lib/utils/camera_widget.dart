import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw2/features/recipe/presentation/recipe_page/recipe_controller.dart';

class CameraWidget extends ConsumerWidget {
  final int id;

  const CameraWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameraInitializer =
        ref.watch(recipeControllerProvider(id).notifier).cameraController;
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
                          onTap: () async => await snapshot.data?.takePicture(),
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
}
