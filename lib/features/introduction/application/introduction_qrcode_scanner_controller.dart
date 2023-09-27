import "package:flutter/cupertino.dart";
import "package:logging/logging.dart";
import "package:mobile_scanner/mobile_scanner.dart";
import "package:repaint_api_client/repaint_api_client.dart";
import "package:repaint_mobile/features/common/domain/entities/user_entity.dart";
import "package:repaint_mobile/features/common/providers/user_providers.dart";
import "package:repaint_mobile/features/visitor/infrastructure/repositories/visitor_repository.dart";

class IntroductionQRCodeReaderController {
  IntroductionQRCodeReaderController(
    this._repository,
    this._user,
    this._registrationId,
  );

  final VisitorRepository _repository;
  final User _user;
  final String? _registrationId;
  bool _onScanned = false;
  static final _logger = Logger("IntroductionQRCodeReaderController");

  Future<void> onQRCodeScanned(
    BuildContext context,
    BarcodeCapture capture,
  ) async {
    if (!_onScanned) {
      _onScanned = true;
      final urlString = capture.barcodes.first.url?.url ?? "";
      final uri = Uri.tryParse(urlString);
      final eventID = uri?.queryParameters["event_id"];

      if (eventID != null) {
        _logger.info("eventID: $eventID, _registrationId: $_registrationId");

        if (_registrationId == null) {
          _logger.warning("registrationId is null");
          return;
        }

        final result = await _repository.joinEvent(
          eventID,
          JoinEventRequest(registrationId: _registrationId!),
        );

        await result.fold(
          (l) {
            _logger.warning(l);
          },
          (r) async {
            await _user.setType(UserType.visitor);
          },
        );
      }
    }
  }
}
