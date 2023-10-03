import "package:flutter/cupertino.dart";
import "package:logging/logging.dart";
import "package:mobile_scanner/mobile_scanner.dart";
import "package:repaint_api_client/repaint_api_client.dart";
import "package:repaint_mobile/features/common/providers/user_providers.dart";
import "package:repaint_mobile/features/visitor/infrastructure/repositories/visitor_repository.dart";

class IntroductionQRCodeReaderController {
  IntroductionQRCodeReaderController(
    this._repository,
    this._visitor,
    this._registrationId,
  );

  final VisitorRepository _repository;
  final VisitorUser _visitor;
  final String? _registrationId;
  bool _isScanned = false;
  static final _logger = Logger("IntroductionQRCodeReaderController");

  Future<void> onQRCodeScanned(
    BuildContext context,
    BarcodeCapture capture,
  ) async {
    final urlString = capture.barcodes.first.url?.url ?? "";
    final uri = Uri.tryParse(urlString);
    final eventId = uri?.queryParameters["event_id"];

    if (!_isScanned && eventId != null) {
      _isScanned = true;
      _logger.info("eventId: $eventId, _registrationId: $_registrationId");

      if (_registrationId == null) {
        _logger.warning("registrationId is null");
        return;
      }

      final result = await _repository.joinEvent(
        JoinEventRequest(
          eventId: eventId,
          registrationId: _registrationId!,
        ),
      );

      await result.fold(
        (l) {
          _logger.warning(l);
        },
        (r) => _visitor.register(r.value),
      );
    }
  }
}
