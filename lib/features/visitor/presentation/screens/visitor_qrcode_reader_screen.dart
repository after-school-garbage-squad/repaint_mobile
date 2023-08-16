import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/camera_scaffold.dart';

@RoutePage()
class VisitorQRCodeReaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CameraScaffold(
      // TODO: カメラを実装する
      preview: Expanded(child: Placeholder()),
      children: [
        Padding(
          padding: EdgeInsets.only(top: 64.0),
          child: Center(child: Text('スポットのQRコードを読み込んでください')),
        ),
      ],
    );
  }
}
