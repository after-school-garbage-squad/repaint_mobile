import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:logging/logging.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_camera_preview_screen.dart';
import 'package:repaint_mobile/utils.dart';

class OperatorCameraPreviewController {
  const OperatorCameraPreviewController(this._client, this._user);

  static final Logger _logger = Logger("OperatorCameraPreviewController");

  final RepaintApiClient _client;
  final OperatorUserEntity _user;

  void onCancelPressed(BuildContext context) {
    context.popRoute();
  }

  Future<void> onRegisterPressed(
    BuildContext context,
    String? imagePath,
  ) async {
    if (imagePath == null && _user.token == null && _user.eventId == null) {
      return;
    }
    _logger.info(imagePath);

    final file = await File(imagePath!).readAsBytes();
    final multipart = MultipartFile.fromBytes(
      file,
      filename: "hoge.png",
      contentType: MediaType("image", "png"),
    );

    await _client.getAdminApi().uploadVisitorImage(
          eventID: _user.eventId!,
          image: multipart,
          headers: getAdminApiHeaders(_user.token!)
            ..addAll({
              Headers.contentTypeHeader: 'multipart/form-data',
              Headers.contentLengthHeader: multipart.length.toString(),
            }),
        );

    if (context.mounted) {
      showDialog(
        context: context,
        builder: (_) => PictureRegisteredDialog(
          onPressed: () => _onDialogBackPressed(context),
        ),
      );
    }
  }

  void _onDialogBackPressed(BuildContext context) {
    context.router.popUntil(
      (route) => route.data?.name == const OperatorHomeRoute().routeName,
    );
  }
}
