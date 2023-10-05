import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/visitor/presentation/screens/visitor_home_screen.dart';

class VisitorHomeController {
  const VisitorHomeController(this._client, this._user);

  final RepaintApiClient _client;
  final VisitorUser _user;

  void onSettingsPressed(BuildContext context) {
    context.pushRoute(const VisitorSettingsRoute());
  }

  Future<void> onDownloadImagePressed(BuildContext context) async {
    final visitor = (await _user.future).visitorIdentification;
    if (visitor == null) return;

    final imageId = await _client.getVisitorApi().getCurrentImage(
          visitorId: visitor.visitorId,
          eventId: visitor.eventId,
        );
    if (imageId.data?.imageId == null) return;

    final imageUrl = await _client.getVisitorApi().getCurrentImageURL(
          visitorId: visitor.visitorId,
          eventId: visitor.eventId,
          visitorImageId: imageId.data!.imageId,
        );
    if (imageUrl.data?.url == null) return;

    final image = await _client.dio.request(
      imageUrl.data!.url,
      options: Options(responseType: ResponseType.bytes),
    );
    if (image.data == null) return;

    await ImageGallerySaver.saveImage(
      Uint8List.fromList(image.data as List<int>),
      quality: 60,
      name: "repaint_${visitor.eventId}_${visitor.visitorId}",
    );
  }

  void onChangeImagePressed(BuildContext context) {
    context.pushRoute(const VisitorImagesRoute());
  }

  Future<void> onShowQRCodePressed(
    BuildContext context,
  ) async {
    final visitorIdentification = (await _user.future).visitorIdentification;
    if (context.mounted && visitorIdentification != null) {
      showDialog(
        context: context,
        builder: (context) => QRCodeViewDialog(visitorIdentification),
      );
    }
  }

  void onReadQRCodePressed(BuildContext context) {
    context.pushRoute(const VisitorQRCodeReaderRoute());
  }
}
