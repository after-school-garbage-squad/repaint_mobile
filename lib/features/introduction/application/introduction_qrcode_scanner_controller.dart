import "package:flutter/cupertino.dart";
import "package:logging/logging.dart";
import "package:mobile_scanner/mobile_scanner.dart";
import "package:repaint_api_client/repaint_api_client.dart";
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
    final urlString = capture.barcodes.first.url?.url;
    final uri = urlString != null ? Uri.tryParse(urlString) : null;
    final eventId = uri?.queryParameters["event_id"];

    if (!_isScanned && eventId != null) {
      _isScanned = true;
      _logger.info("eventId: $eventId, _registrationId: $_registrationId");

      if (_registrationId == null) {
        _logger.warning("registrationId is null");
        return;
      }

      final result = await _client.getVisitorApi().joinEvent(
            joinEventRequest: JoinEventRequest(
              eventId: eventId,
              registrationId: _registrationId!,
            ),
          );

      if (result.data?.visitor == null) return;
      return _user.register(result.data!.visitor);
    }
  }
}
