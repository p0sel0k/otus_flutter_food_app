import 'package:camera/camera.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'camera_api_repository.g.dart';

class CameraApiRepository {
  final Future<CameraController> controller;

  CameraApiRepository() : controller = initCameraController();

  static Future<CameraController> initCameraController() async {
    final camera = (await availableCameras()).first;
    final controller = CameraController(camera, ResolutionPreset.medium);
    await controller.initialize();
    return controller;
  }
}

@riverpod
CameraApiRepository cameraApiRepository(CameraApiRepositoryRef ref) {
  return CameraApiRepository();
}
