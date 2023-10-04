import 'package:camera/camera.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'camera_controller_providers.g.dart';

@Riverpod(dependencies: [])
Future<Raw<CameraController>> cameraController(CameraControllerRef ref) async {
  final cameras = await availableCameras();
  final controller = CameraController(
    cameras[0],
    ResolutionPreset.low,
    enableAudio: false,
    imageFormatGroup: ImageFormatGroup.yuv420,
  );
  await controller.initialize();

  ref.onDispose(() async {
    await controller.dispose();
  });

  ref.onResume(() async {
    await controller.initialize();
  });

  return controller;
}
