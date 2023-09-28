import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/camera_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';
import 'package:repaint_mobile/features/operator/providers/providers.dart';

@RoutePage()
class OperatorCameraScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(operatorCameraControllerProvider);

    return CameraScaffold(
      // TODO: カメラを実装する
      onBackPressed: () => controller.onPictureTaken(context),
      preview: const Placeholder(),
      children: [
        Center(
          child: FlatIconButton(
            onPressed: () {},
            icon: Icons.camera_alt,
            padding: const EdgeInsets.all(18.0),
            colors: const FlatIconButtonColors(
              backgroundColor: Colors.white,
              shadowColor: Colors.black,
            ),
            elevation: 4.0,
          ),
        ),
      ],
    );
  }
}
