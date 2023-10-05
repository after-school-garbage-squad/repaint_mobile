import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';

class VisitorImagesController {
  const VisitorImagesController(this._client, this._user);

  final RepaintApiClient _client;
  final VisitorUserEntity _user;

  Future<void> onImagePressed(BuildContext context, String imageId) async {
    if (_user.visitorIdentification == null) return;
    await _client.getVisitorApi().setCurrentImage(
          visitorId: _user.visitorIdentification!.visitorId,
          setCurrentImageRequest: SetCurrentImageRequest(
            eventId: _user.visitorIdentification!.eventId,
            imageId: imageId,
          ),
        );
    if (context.mounted) {
      context.popRoute();
    }
  }
}
