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

  void onQRCodeScanned(BuildContext context, BarcodeCapture capture) {
    if (_isScanned) return;
    final result = parseQRCode<SpotQRCodeEntity>(capture.barcodes[0].rawValue);
    if (_user.visitorIdentification == null && result == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("QRコードが不正です"),
        ),
      );
    }
    _isScanned = true;

    _client.getVisitorApi().pickPalette(
          visitorId: _user.visitorIdentification!.visitorId,
          pickPaletteRequest: PickPaletteRequest(
            eventId: _user.visitorIdentification!.eventId,
            spotId: result!.spotId,
          ),
        );
  }
}
