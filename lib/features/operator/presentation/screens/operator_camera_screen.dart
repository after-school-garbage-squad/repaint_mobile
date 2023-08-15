import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/camera_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';

@RoutePage()
class OperatorCameraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CameraScaffold(
      // TODO: カメラを実装する
      preview: const Expanded(child: Placeholder()),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 64.0),
          child: Center(
            child: FlatIconButton(
              onPressed: () {
                // TODO: 撮影処理の実装
                context.navigateNamedTo("camera/preview");
              },
              icon: Icons.camera,
              size: const Size.square(67.0),
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
