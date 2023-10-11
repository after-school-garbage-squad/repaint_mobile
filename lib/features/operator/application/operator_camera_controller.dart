import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:image/image.dart' as img;
import 'package:logging/logging.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:repaint_mobile/config/app_router.dart';

class OperatorCameraController {
  const OperatorCameraController();

  static final _logger = Logger("OperatorCameraController");

  void onBackPressed(BuildContext context) {
    context.popRoute();
  }

  Future<void> onPictureTaken(
    BuildContext context,
    CameraController cameraController,
  ) async {
    _logger.info('picture taking...');
    final picture = await cameraController.takePicture();
    final imageBytes = await picture.readAsBytes();
    final bitmap = img.decodeImage(imageBytes);
    final directory = await getApplicationCacheDirectory();
    final path = join(directory.path, "${DateTime.now()}.png");

    if (bitmap == null) return;

    await File(path).writeAsBytes(img.encodePng(bitmap));
    _logger.info('picture taken: $path');

    if (context.mounted) {
      context.replaceRoute(
        OperatorCameraPreviewRoute(imagePath: path),
      );
    }
  }
}
