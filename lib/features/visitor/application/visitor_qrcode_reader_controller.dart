import 'dart:convert';

import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/features/common/domain/entities/qrcode_entity.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';

class VisitorQRCodeReaderController {
  const VisitorQRCodeReaderController(this._client, this._user);

  final RepaintApiClient _client;
  final VisitorUserEntity _user;

  void onQRCodeScanned(BarcodeCapture capture) {
    final rawValue = capture.barcodes[0].rawValue;
    if (_user.visitorIdentification == null && rawValue == null) return;
    final spot = SpotQRCodeEntity.fromJson(
      jsonDecode(rawValue!) as Map<String, dynamic>,
    );

    _client.getVisitorApi().pickPalette(
          visitorId: _user.visitorIdentification!.visitorId,
          pickPaletteRequest: PickPaletteRequest(
            eventId: _user.visitorIdentification!.eventId,
            spotId: spot.eventId,
          ),
        );
  }
}
