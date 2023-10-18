import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';
import 'package:repaint_mobile/features/common/providers/firebase_providers.dart';
import 'package:repaint_mobile/features/visitor/providers/visitor_providers.dart';

class VisitorImagesController {
  const VisitorImagesController(this._client, this._userdata);

  final RepaintApiClient _client;
  final VisitorUserEntity _userdata;

  Future<void> onImagePressed(
    BuildContext context,
    WidgetRef ref,
    String imageId,
  ) async {
    if (_userdata.visitor == null) return;

    await analytics.logEvent(name: 'visitor_image_pressed');

    await _client.getVisitorApi().setCurrentImage(
          visitorId: _userdata.visitor!.visitorIdentification.visitorId,
          setCurrentImageRequest: SetCurrentImageRequest(
            eventId: _userdata.visitor!.visitorIdentification.eventId,
            imageId: imageId,
          ),
        );

    isImageRenewable = true;
    ref.invalidate(visitorSelectedImageProvider);

    if (context.mounted) {
      context.popRoute();
    }
  }
}
