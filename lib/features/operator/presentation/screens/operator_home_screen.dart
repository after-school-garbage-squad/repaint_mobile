import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/repaint_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/operator/presentation/widgets/operator_elevated_tile.dart';
import 'package:repaint_mobile/features/operator/providers/providers.dart';

@RoutePage()
class OperatorHomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(operatorHomeControllerProvider);

    return RepaintScaffold(
      title: "管理者画面",
      isBackButtonVisible: false,
      action: FlatIconButton(
        onPressed: () => controller.onSettingsPressed(context),
        icon: Icons.settings,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        children: [
          OperatorElevatedTile(
            automaticallyImplyTail: false,
            padding: const EdgeInsets.all(16),
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TODO: 選択中のイベントを表示する
              Text(
                "選択中のイベント",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              WideElevatedButton(
                onPressed: () => controller.onChangeEventPressed(context),
                text: "イベントを変更",
                colors: WideElevatedButtonColors(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  textColor: Theme.of(context).colorScheme.primary,
                ),
                elevation: 0.0,
              ),
            ],
          ),
          const SizedBox(height: 16),
          OperatorElevatedTile.action(
            onTap: () => controller.onQRCodeReaderPressed(context),
            title: "QRコードを読み取る",
            icon: Icons.qr_code_scanner,
          ),
          const SizedBox(height: 16),
          OperatorElevatedTile.action(
            onTap: () => controller.onCameraPressed(context),
            title: "写真を撮影する",
            icon: Icons.camera_alt,
          ),
          const SizedBox(height: 16),
          OperatorElevatedTile.action(
            onTap: () => controller.onBeaconListPressed(context),
            title: "ビーコンを設定する",
            // TODO: 仮で設定した下記のアイコンを変更するかを検討する
            icon: Icons.settings_input_antenna,
          ),
        ],
      ),
    );
  }
}
