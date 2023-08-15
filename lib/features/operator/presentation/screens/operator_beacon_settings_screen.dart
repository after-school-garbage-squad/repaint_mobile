import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_heading.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/settings_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/settings_tile.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';

@RoutePage()
class OperatorBeaconSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SettingsScaffold(
      title: "ビーコン設定",
      children: [
        const ListHeading("ビーコンの設定"),
        const SizedBox(height: 16),
        // TODO: ビーコンの名前変更処理を実装する
        SettingsTile.textField(
          label: "ビーコンの名前",
          controller: TextEditingController(),
        ),
        const Spacer(),
        Row(
          children: [
            Expanded(
              child: WideElevatedButton(
                onPressed: () {
                  // TODO: ビーコンの登録解除処理を実装する
                  context.popRoute();
                },
                text: "登録解除",
                colors: const WideElevatedButtonColors(
                  backgroundColor: Colors.white,
                  borderColor: Colors.white,
                  textColor: Colors.red,
                ),
              ),
            ),
            const SizedBox(width: 32.0),
            Expanded(
              child: WideElevatedButton(
                onPressed: () {
                  // TODO: ビーコンの登録処理を実装する
                  context.popRoute();
                },
                text: "登録する",
              ),
            ),
          ],
        ),
        const BottomConstrainedPadding(),
      ],
    );
  }
}
