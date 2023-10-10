import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/features/common/domain/entities/qrcode_entity.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';

class VisitorQRCodeReaderController {
  VisitorQRCodeReaderController(this._client, this._user);

  final RepaintApiClient _client;
  final VisitorUserEntity _user;
  bool _isScanned = false;

  Future<void> onQRCodeScanned(
    BuildContext context,
    BarcodeCapture capture,
  ) async {
    if (_isScanned) return;
    _isScanned = true;

    final result = parseQRCode<SpotQRCodeEntity>(capture.barcodes[0].rawValue);
    if (_user.visitor == null && result == null) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("QRコードが不正です"),
        ),
      );
      _isScanned = false;
      return;
    }

    try {
      await _client.getVisitorApi().pickPalette(
            visitorId: _user.visitor!.visitorIdentification.visitorId,
            pickPaletteRequest: PickPaletteRequest(
              eventId: _user.visitor!.visitorIdentification.eventId,
              spotId: result!.spotId,
            ),
          );
    } catch (e) {
      await Future.delayed(const Duration(seconds: 3));
      _isScanned = false;
      return;
    }
  }
}
