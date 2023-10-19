import "package:flutter/material.dart";
import "package:logging/logging.dart";
import "package:mobile_scanner/mobile_scanner.dart";
import "package:repaint_api_client/repaint_api_client.dart";
import "package:repaint_mobile/features/common/domain/entities/qrcode_entity.dart";
import "package:repaint_mobile/features/common/providers/firebase_providers.dart";
import "package:repaint_mobile/features/common/providers/user_providers.dart";

class IntroductionQRCodeReaderController {
  IntroductionQRCodeReaderController(
    this._client,
    this._user,
    this._registrationId,
  );

  final RepaintApiClient _client;
  final VisitorUser _user;
  final String? _registrationId;
  bool _isScanned = false;
  static final _logger = Logger("IntroductionQRCodeReaderController");

  Future<void> onQRCodeScanned(
    BuildContext context,
    BarcodeCapture capture,
  ) async {
    if (_isScanned) return;
    _isScanned = true;
    await analytics.logEvent(name: "qrcode_scanned");
    final data = parseQRCode<EventQRCodeEntity>(capture.barcodes[0].rawValue);
    if (data?.eventId == null) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("QRコードが不正です"),
          ),
        );
      }
      await analytics.logEvent(name: 'invalid_qrcode_scanned');
      await Future.delayed(const Duration(seconds: 3));
      _isScanned = false;
      return;
    }
    _logger
        .info("eventId: ${data?.eventId}, _registrationId: $_registrationId");

    if (_registrationId == null) {
      _logger.warning("registrationId is null");
      return;
    }

    try {
      final result = await _client.getVisitorApi().joinEvent(
            joinEventRequest: JoinEventRequest(
              eventId: data!.eventId!,
              registrationId: _registrationId!,
            ),
          );
      if (result.data == null) return;
      return _user.register(result.data!);
    } catch (e) {
      await Future.delayed(const Duration(seconds: 3));
      _isScanned = false;
      return;
    }
  }
}
