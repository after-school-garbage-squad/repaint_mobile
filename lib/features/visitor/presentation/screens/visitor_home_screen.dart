import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/app_dialog.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/repaint_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/visitor/presentation/widgets/action_elevated_button.dart';
import 'package:repaint_mobile/features/visitor/providers/providers.dart';

@RoutePage()
class VisitorHomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(visitorHomeControllerProvider);

    return RepaintScaffold(
      isBackButtonVisible: false,
      action: FlatIconButton(
        onPressed: () => controller.onSettingsPressed(context),
        icon: Icons.settings,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 48.0,
                vertical: 32.0,
              ),
              // TODO: 画像を設定する
              child: const AspectRatio(
                aspectRatio: 1.0,
                child: Placeholder(fallbackWidth: double.infinity),
              ),
            ),
            // SizedBox(
            //   height: 32.0,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       DotIndicator(onPressed: () {}, enabled: true),
            //       const SizedBox(width: 32.0),
            //       DotIndicator(onPressed: () {}),
            //       const SizedBox(width: 32.0),
            //       DotIndicator(onPressed: () {}),
            //       const SizedBox(width: 32.0),
            //       DotIndicator(onPressed: () {}),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 12.0),
            // ProgressBar(progress: Random().nextDouble()),
            Row(
              children: [
                Expanded(
                  child: ActionElevatedButton(
                    onPressed: () => controller.onShowQRCodePressed(context),
                    text: "QRコードの表示",
                    icon: Icons.qr_code,
                    colors: ActionElevatedButtonColors(
                      borderColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 24.0),
                Expanded(
                  child: ActionElevatedButton(
                    onPressed: () => controller.onReadQRCodePressed(context),
                    text: "QRコードの読取",
                    icon: Icons.qr_code_scanner,
                    colors: ActionElevatedButtonColors(
                      borderColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            WideElevatedButton(
              onPressed: () => controller.onDownloadPressed(context),
              text: "ダウンロード",
              icon: Icons.group,
              colors: WideElevatedButtonColors(
                backgroundColor:
                    Theme.of(context).colorScheme.tertiaryContainer,
              ),
            ),
            const SizedBox(height: 24.0),
            WideElevatedButton(
              onPressed: () => controller.onEventPressed(context),
              text: "イベントHPを見る",
              colors: const WideElevatedButtonColors(
                backgroundColor: Colors.white,
              ),
            ),
            const BottomPadding(),
          ],
        ),
      ),
    );
  }
}

class QRCodeViewDialog extends StatelessWidget {
  const QRCodeViewDialog();

  @override
  Widget build(BuildContext context) {
    return const AppDialog(
      children: [
        // TODO: QRコードを実際の画像に設定する
        Icon(Icons.qr_code, size: 200.0),
        SizedBox(height: 24.0),
        Text("写真撮影の際にご掲示ください"),
      ],
    );
  }
}
