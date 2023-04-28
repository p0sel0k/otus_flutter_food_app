import 'dart:io';

import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:tflite_flutter_helper_plus/tflite_flutter_helper_plus.dart';

part 'tflite_repository.g.dart';

const tflite_model = 'assets/model/ssd_mobilenet_v1_1_metadata_1.tflite';
const tflite_labels = 'assets/model/labelmap.txt';

class TfliteRepository {
  Future<TfliteRepository> loadModel() async {
    final model = await Tflite.loadModel(
      model: tflite_model,
      labels: tflite_labels,
    );
    if (model == null) {
      throw '[TfliteREpository]: could not load model: $tflite_model';
    }
    return TfliteRepository();
  }

  Future<List<dynamic>> runOnImage(String path) async {
    // final proccessor = ImageProcessorBuilder()
    //     .add(ResizeOp(224, 224, ResizeMethod.nearestneighbour))
    //     .build();
    // var tensorImg = TensorImage.fromFile(img);
    // tensorImg = proccessor.process(tensorImg);
    final detect = await Tflite.runModelOnImage(path: path);
    if (detect == null) {
      throw '[TfliteRepository]: Nothing has been detected';
    }
    return detect;
  }
}

@Riverpod(keepAlive: true)
TfliteRepository tfliteRepository(TfliteRepositoryRef ref) {
  // ref.onDispose(() => Tflite.close());
  return TfliteRepository();
}
