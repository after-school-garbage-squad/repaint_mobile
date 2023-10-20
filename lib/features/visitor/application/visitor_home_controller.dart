import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';
import 'package:repaint_mobile/features/common/providers/firebase_providers.dart';
import 'package:repaint_mobile/features/visitor/presentation/screens/visitor_home_screen.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:url_launcher/url_launcher_string.dart';

class VisitorHomeController {
  const VisitorHomeController(this._client, this._userdata);

  final RepaintApiClient _client;
  final VisitorUserEntity _userdata;

  Future<void> onSettingsPressed(BuildContext context) async {
    await analytics.logEvent(name: 'visitor_settings_pressed');
    if (context.mounted) {
      context.pushRoute(const VisitorSettingsRoute());
    }
  }

  Future<void> onDownloadImagePressed(BuildContext context) async {
    if (_userdata.visitor == null) return;

    await analytics.logEvent(name: 'visitor_download_image_pressed');

    // final isDownloadable = await _client.getVisitorApi().checkDownload(
    //       visitorId: _userdata.visitor!.visitorIdentification.visitorId,
    //       eventId: _userdata.visitor!.visitorIdentification.eventId,
    //     );
    // if (isDownloadable.data?.isDownloadable == false && context.mounted) {
    //   ScaffoldMessenger.of(context).hideCurrentSnackBar();
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text("イベント中に色を全て取得するか、イベント終了後に保存できます。"),
    //       duration: Duration(seconds: 3),
    //     ),
    //   );
    //   return;
    // }

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

    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/temp.png');
    await file.writeAsBytes(image.data as List<int>);

    final isSuccess =
        await GallerySaver.saveImage(file.path, albumName: "Repaint");

    if (context.mounted) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      if (isSuccess == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("画像を保存しました"),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("画像を保存するためには許可が必要です"),
            action: SnackBarAction(
              label: "設定",
              onPressed: openAppSettings,
            ),
          ),
        );
      }
    }
  }

  Future<void> onChangeImagePressed(BuildContext context) async {
    await analytics.logEvent(name: 'visitor_change_image_pressed');
    if (context.mounted) {
      context.pushRoute(const VisitorImagesRoute());
    }
  }

  Future<void> onShowQRCodePressed(
    BuildContext context,
  ) async {
    await analytics.logEvent(name: 'visitor_show_qrcode_pressed');
    await ScreenBrightness().setScreenBrightness(1.0);
    if (context.mounted && _userdata.visitor != null) {
      showDialog(
        context: context,
        builder: (context) => WillPopScope(
          child: QRCodeViewDialog(_userdata.visitor!.visitorIdentification),
          onWillPop: () async {
            await ScreenBrightness().resetScreenBrightness();
            return true;
          },
        ),
      );
    }
  }

  Future<void> onReadQRCodePressed(BuildContext context) async {
    await analytics.logEvent(name: 'visitor_read_qrcode_pressed');
    if (context.mounted) {
      if (_userdata.isCompleted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("全てのパレットを獲得済みです"),
          ),
        );
      } else {
        context.pushRoute(const VisitorQRCodeReaderRoute());
      }
    }
  }

  Future<void> onOpenEventPressed() async {
    await analytics.logEvent(name: 'visitor_open_event_pressed');
    if (_userdata.event != null) {
      launchUrlString(_userdata.event!.hpUrl);
    }
  }
}
