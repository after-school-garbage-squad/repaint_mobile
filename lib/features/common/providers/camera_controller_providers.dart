import 'package:camera/camera.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'camera_controller_providers.g.dart';

@Riverpod(dependencies: [])
Future<Raw<CameraController>> cameraController(CameraControllerRef ref) async {
  final cameras = await availableCameras();
  final controller = CameraController(
    cameras[0],
    ResolutionPreset.medium,
    enableAudio: false,
  );

  ref.onDispose(() async {
    await controller.dispose();
  });

  await controller.initialize();
  return controller;
}
