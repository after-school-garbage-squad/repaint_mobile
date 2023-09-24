import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/visitor/presentation/screens/visitor_home_screen.dart';

class VisitorHomeController {
  const VisitorHomeController();

  void onSettingsPressed(BuildContext context) {
    context.pushRoute(const VisitorSettingsRoute());
  }

  void onDownloadPressed(BuildContext context) {
    // TODO: ダウンロード機能を実装する
  }

  void onShowQRCodePressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const QRCodeViewDialog(),
    );
  }

  void onReadQRCodePressed(BuildContext context) {
    context.pushRoute(const VisitorQRCodeReaderRoute());
  }

  void onEventPressed(BuildContext context) {
    // TODO: イベントHPに遷移できるようにする
  }
}
