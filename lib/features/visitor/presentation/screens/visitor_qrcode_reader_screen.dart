import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/camera_scaffold.dart';

@RoutePage()
class VisitorQRCodeReaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CameraScaffold(
      // TODO: カメラを実装する
      preview: Expanded(
        child: MobileScanner(
          onDetect: (capture) {
            // TODO: QRコードの内容を取得した際の処理を実装する
          },
        ),
      ),
      children: const [
        Center(child: Text('スポットのQRコードを読み込んでください')),
      ],
    );
  }
}
