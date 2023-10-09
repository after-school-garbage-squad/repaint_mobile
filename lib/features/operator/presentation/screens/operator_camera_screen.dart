import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/camera_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/material_banner.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/snackbar.dart';
import 'package:repaint_mobile/features/operator/providers/providers.dart';

@RoutePage()
class OperatorCameraScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameraControllerValue = ref.watch(cameraControllerProvider);
    final controller = ref.watch(operatorCameraControllerProvider);
    final height = MediaQuery.of(context).size.height;

    ref.listen(
      networkErrorProvider,
      (previous, next) => showNetworkErrorSnackBar(context, next),
    );

    ref.listen(
      bluetoothServiceProvider,
      (previous, next) => showBluetoothErrorMaterialBanner(
        context,
        previous?.value,
        next.value,
      ),
    );

    ref.listen(
      locationServiceProvider,
      (previous, next) => showLocationErrorMaterialBanner(
        context,
        previous?.value,
        next.value,
      ),
    );

    return CameraScaffold(
      onBackPressed: () => controller.onBackPressed(context),
      preview: cameraControllerValue.maybeWhen(
        data: (cameraController) {
          return ClipRect(
            child: OverflowBox(
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: SizedBox(
                  width: height / cameraController.value.aspectRatio,
                  height: height,
                  child: AspectRatio(
                    aspectRatio: cameraController.value.aspectRatio,
                    child: CameraPreview(cameraController),
                  ),
                ),
              ),
            ),
          );
        },
        orElse: () => const Center(child: CircularProgressIndicator()),
      ),
      children: [
        Center(
          child: FlatIconButton(
            onPressed: () async => controller.onPictureTaken(
              context,
              await ref.read(cameraControllerProvider.future),
            ),
            icon: Icons.camera_alt,
            padding: const EdgeInsets.all(18.0),
            colors: const FlatIconButtonColors(
              backgroundColor: Colors.white,
              shadowColor: Colors.black,
            ),
            elevation: 1.0,
          ),
        ),
      ],
    );
  }
}
