import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';

class IntroductionWelcomeText extends StatelessWidget {
  const IntroductionWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.bodyMedium;
    final boldStyle = baseStyle?.copyWith(color: Colors.red);

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "「Re:paint」を正しくご利用していただくために、", style: baseStyle),
          TextSpan(text: "通知", style: boldStyle),
          TextSpan(text: "と", style: baseStyle),
          TextSpan(text: "位置情報", style: boldStyle),
          TextSpan(
            text: "の使用の許可する必要があります。\n\n「進む」を押した後に許可をお願いしいたします。",
            style: baseStyle,
          ),
        ],
      ),
    );
  }
}

@RoutePage()
class IntroductionWelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          FlatIconButton(
            onPressed: () {
              context.navigateNamedTo("settings");
            },
            icon: Icons.settings,
          ),
          // TODO: https://github.com/flutter/flutter/issues/118965
          const SizedBox(width: 16.0)
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
        child: Column(
          children: [
            ConstrainedBox(
              // TODO: 実際の画像のサイズに合わせる
              constraints: const BoxConstraints(maxHeight: 480.0),
              child: const AspectRatio(
                aspectRatio: 1,
                // TODO: 画像を設定する
                child: Placeholder(fallbackWidth: double.infinity),
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              "ようこそ!",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12.0),
            const IntroductionWelcomeText(),
            const Spacer(),
            // TODO: 権限の許可を求める
            WideElevatedButton(
              onPressed: () {
                context.navigateNamedTo("explain");
              },
              text: "進む",
            ),
            const BottomConstrainedPadding(),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
