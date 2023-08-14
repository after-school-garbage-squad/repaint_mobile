import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/camera_scaffold.dart';

@RoutePage()
class VisitorQRCodeReaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CameraScaffold(
      // TODO: カメラを実装する
      preview: const Expanded(child: Placeholder()),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 64.0),
          child: Center(
            child: Text(
              'スポットのQRコードを読み込んでください',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
