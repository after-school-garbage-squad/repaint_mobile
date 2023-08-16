import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/config/app_router.gr.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/camera_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';

@RoutePage()
class OperatorCameraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CameraScaffold(
      // TODO: カメラを実装する
      onBackPressed: () {
        context.navigateTo(const OperatorHomeRoute());
      },
      preview: const Expanded(child: Placeholder()),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 64.0),
          child: Center(
            child: FlatIconButton(
              onPressed: () {
                // TODO: 撮影処理の実装
                context.replaceRoute(const OperatorCameraPreviewRoute());
              },
              icon: Icons.camera_alt,
              padding: const EdgeInsets.all(18.0),
              colors: const FlatIconButtonColors(
                backgroundColor: Colors.white,
                borderColor: Colors.black,
                shadowColor: Colors.black,
              ),
              elevation: 4.0,
            ),
          ),
        ),
      ],
    );
  }
}
