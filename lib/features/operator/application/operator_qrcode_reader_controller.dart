import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:logging/logging.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/common/domain/entities/qrcode_entity.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_qrcode_reader_screen.dart';
import 'package:repaint_mobile/utils.dart';

class OperatorQRCodeReaderController {
  OperatorQRCodeReaderController(this._client, this._user);

  static final Logger _logger = Logger("OperatorQRCodeReaderController");

  final RepaintApiClient _client;
  final OperatorUserEntity _user;
  bool _isScanned = false;

  Future<void> onQRCodeScanned(
    BuildContext context,
    BarcodeCapture capture,
    String? imagePath,
  ) async {
    if (_isScanned) return;

    final rawValue = capture.barcodes[0].rawValue;
    _logger.info(rawValue);
    if (imagePath == null &&
        _user.token == null &&
        _user.eventId == null &&
        rawValue == null) {
      return;
    }
    _logger.info(imagePath);

    final json = jsonDecode(rawValue!) as Map<String, dynamic>;
    _logger.info(json);

    final result = VisitorQRCodeEntity.fromJson(json);
    _logger.info(result.userId);

    _isScanned = true;

    final file = await File(imagePath!).readAsBytes();
    final multipart = MultipartFile.fromBytes(
      file,
      filename: "${result.userId}.png",
      contentType: MediaType("image", "png"),
    );

    await _client.getAdminApi().uploadVisitorImage(
          eventId: _user.eventId!,
          image: multipart,
          headers: getAdminApiHeaders(_user.token!)
            ..addAll({
              Headers.contentTypeHeader: 'multipart/form-data',
              Headers.contentLengthHeader: multipart.length.toString(),
            }),
        );

    if (context.mounted) {
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => WillPopScope(
          onWillPop: () async => !_isScanned,
          child: QRCodeReaderScannedDialog(
            onContinueScanning: () => onContinueScanning(context),
            onMoveToHome: () => onMoveToHome(context),
          ),
        ),
      );
    }
  }

  void onContinueScanning(BuildContext context) {
    _isScanned = false;
    context.popRoute();
  }

  void onMoveToHome(BuildContext context) {
    context.replaceRoute(const OperatorHomeRoute());
  }
}
