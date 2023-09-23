import "package:auto_route/auto_route.dart";
import "package:flutter/cupertino.dart";
import "package:logger/logger.dart";
import "package:mobile_scanner/mobile_scanner.dart";
import "package:repaint_api_client/repaint_api_client.dart";
import "package:repaint_mobile/config/app_router.dart";
import "package:repaint_mobile/features/common/domain/entities/user_entity.dart";
import "package:repaint_mobile/features/common/providers/user_providers.dart";
import "package:repaint_mobile/features/visitor/infrastructure/repositories/visitor_repository.dart";

class IntroductionQRCodeReaderController {
  const IntroductionQRCodeReaderController(
    this._repository,
    this._user,
    this._logger,
  );

  final VisitorRepository _repository;
  final User _user;
  final Logger _logger;

  Future<void> onQRCodeScanned(
    BuildContext context,
    BarcodeCapture capture,
  ) async {
    final urlString = capture.barcodes.first.url?.url ?? "";
    final uri = Uri.tryParse(urlString);
    final eventID = uri?.queryParameters["event_id"];

    if (eventID != null) {
      _logger.d("eventID: $eventID");

      // TODO: Firebaseの設定をする
      _repository.joinEvent(
        eventID,
        JoinEventRequest(registrationId: "registrationId"),
      );

      if (context.mounted) {
        context.router.pushAndPopUntil(
          const VisitorHomeRoute(),
          predicate: (_) => false,
        );
        await _user.setType(UserType.visitor);
      }
    }
  }
}
