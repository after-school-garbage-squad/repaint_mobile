import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';
import 'package:repaint_mobile/features/visitor/presentation/screens/visitor_home_screen.dart';
import 'package:url_launcher/url_launcher_string.dart';

class VisitorHomeController {
  const VisitorHomeController(this._client, this._userdata);

  final RepaintApiClient _client;
  final VisitorUserEntity _userdata;

  void onSettingsPressed(BuildContext context) {
    context.pushRoute(const VisitorSettingsRoute());
  }

  Future<void> onDownloadImagePressed(BuildContext context) async {
    if (_userdata.visitor == null) return;

    final isDownloadable = await _client.getVisitorApi().checkDownload(
          visitorId: _userdata.visitor!.visitorIdentification.visitorId,
          eventId: _userdata.visitor!.visitorIdentification.eventId,
        );
    if (isDownloadable.data?.isDownloadable == false && context.mounted) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("イベント中に色を全て取得するか、イベント終了後に保存できます。"),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    final imageUrl = await _client.getVisitorApi().getCurrentImageURL(
          visitorId: _userdata.visitor!.visitorIdentification.visitorId,
          eventId: _userdata.visitor!.visitorIdentification.eventId,
          visitorImageId: _userdata.imageId!,
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
      name:
          "repaint_${_userdata.visitor!.visitorIdentification.eventId}_${_userdata.visitor!.visitorIdentification.visitorId}",
    );

    if (context.mounted) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("画像を保存しました"),
        ),
      );
    }
  }

  void onChangeImagePressed(BuildContext context) {
    context.pushRoute(const VisitorImagesRoute());
  }

  Future<void> onShowQRCodePressed(
    BuildContext context,
  ) async {
    if (context.mounted && _userdata.visitor != null) {
      showDialog(
        context: context,
        builder: (context) =>
            QRCodeViewDialog(_userdata.visitor!.visitorIdentification),
      );
    }
  }

  void onReadQRCodePressed(BuildContext context) {
    context.pushRoute(const VisitorQRCodeReaderRoute());
  }

  void onOpenEventPressed() {
    if (_userdata.event != null) {
      launchUrlString(_userdata.event!.hpUrl);
    }
  }
}
