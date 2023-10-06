import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';

class VisitorImagesController {
  const VisitorImagesController(this._client, this._user, this._userdata);

  final RepaintApiClient _client;
  final VisitorUser _user;
  final VisitorUserEntity _userdata;

  Future<void> onImagePressed(BuildContext context, String imageId) async {
    if (_userdata.visitor == null) return;

    await _client.getVisitorApi().setCurrentImage(
          visitorId: _userdata.visitor!.visitorIdentification.visitorId,
          setCurrentImageRequest: SetCurrentImageRequest(
            eventId: _userdata.visitor!.visitorIdentification.eventId,
            imageId: imageId,
          ),
        );
    await _user.updateImageId((p0) => imageId);

    if (context.mounted) {
      context.popRoute();
    }
  }
}
