import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/common/domain/entities/qrcode_entity.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';
import 'package:repaint_mobile/features/common/providers/firebase_providers.dart';
import 'package:repaint_mobile/features/common/providers/user_providers.dart';
import 'package:repaint_mobile/features/visitor/presentation/screens/visitor_qrcode_reader_screen.dart';

class VisitorQRCodeReaderController {
  VisitorQRCodeReaderController(this._client, this._user);

  final RepaintApiClient _client;
  final VisitorUserEntity _user;
  bool _isScanned = false;

  Future<void> onQRCodeScanned(
    BuildContext context,
    WidgetRef ref,
    BarcodeCapture capture,
  ) async {
    if (_isScanned) return;
    _isScanned = true;

    await analytics.logEvent(
      name: 'spot_qrcode_scanned',
      parameters: {'event_id': _user.event?.eventId},
    );

    final result = parseQRCode<SpotQRCodeEntity>(capture.barcodes[0].rawValue);
    if (_user.visitor == null || result?.spotId == null) {
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

    try {
      final response = await _client.getVisitorApi().pickPalette(
            visitorId: _user.visitor!.visitorIdentification.visitorId,
            pickPaletteRequest: PickPaletteRequest(
              eventId: _user.visitor!.visitorIdentification.eventId,
              spotId: result!.spotId!,
            ),
          );
      if (context.mounted) {
        await showDialog(
          context: context,
          builder: (_) => WillPopScope(
            child: VisitorQRCodeReaderScannedDialog(
              isConflict: response.statusCode == 409,
              onMoveToHome: () async {
                ref.invalidate(visitorUserProvider);
                await context.router.pushAndPopUntil(
                  const VisitorHomeRoute(),
                  predicate: (_) => false,
                );
              },
            ),
            onWillPop: () => Future.value(false),
          ),
        );
      }
    } catch (e) {
      await Future.delayed(const Duration(seconds: 3));
      _isScanned = false;
      return;
    }
  }
}
