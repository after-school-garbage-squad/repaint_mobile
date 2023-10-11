import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    WidgetRef ref,
    QRCodeType type,
    BarcodeCapture capture,
    String? imagePath,
  ) async {
    if (_isScanned) return;
    _isScanned = true;

    if (type == QRCodeType.spot) {
      await onSpotQRCodeScanned(context, ref, capture);
    } else if (type == QRCodeType.visitor) {
      await onVisitorQRCodeScanned(context, capture, imagePath);
    }
  }

  Future<void> onSpotQRCodeScanned(
    BuildContext context,
    WidgetRef ref,
    BarcodeCapture capture,
  ) async {
    final data = parseQRCode<SpotQRCodeEntity>(capture.barcodes[0].rawValue);
    if (data == null) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("QRコードが不正です"),
        ),
      );
      await Future.delayed(const Duration(seconds: 3));
      _isScanned = false;
      return;
    }
    _logger.info("eventId: ${_user.eventId}, spotId: ${data.spotId}");

    if (_user.token == null) return;

    final spot = ((await _client.getAdminApi().getSpots(
                      eventId: _user.eventId!,
                      headers: getAdminApiHeaders(_user.token!),
                    ))
                .data ??
            [])
        .firstWhere((element) => element.spotId == data.spotId);

    if (context.mounted) {
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => WillPopScope(
          onWillPop: () async => !_isScanned,
          child: SpotQRCodeReaderScannedDialog(
            spot: spot,
            onContinueScanning: () => onContinueScanning(context),
          ),
        ),
      );
    }
  }

  Future<void> onVisitorQRCodeScanned(
    BuildContext context,
    BarcodeCapture capture,
    String? imagePath,
  ) async {
    final data = parseQRCode<VisitorQRCodeEntity>(capture.barcodes[0].rawValue);
    if (data == null) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("QRコードが不正です"),
        ),
      );
      await Future.delayed(const Duration(seconds: 3));
      _isScanned = false;
      return;
    }
    _logger.info("eventId: ${_user.eventId}, visitorId: ${data.userId}");

    final file = await File(imagePath!).readAsBytes();
    final multipart = MultipartFile.fromBytes(
      file,
      filename: "${data.userId}.png",
      contentType: MediaType("image", "png"),
    );

    try {
      await _client.getAdminApi().uploadVisitorImage(
            eventId: _user.eventId!,
            image: multipart,
            headers: getAdminApiHeaders(_user.token!)
              ..addAll({
                Headers.contentTypeHeader: 'multipart/form-data',
                Headers.contentLengthHeader: multipart.length.toString(),
              }),
          );
    } catch (e) {
      await Future.delayed(const Duration(seconds: 3));
      _isScanned = false;
      return;
    }

    if (context.mounted) {
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => WillPopScope(
          onWillPop: () async => !_isScanned,
          child: VisitorQRCodeReaderScannedDialog(
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
