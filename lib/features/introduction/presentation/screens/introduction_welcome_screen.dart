import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/permissions.dart';
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
      style: baseStyle,
      TextSpan(
        children: [
          const TextSpan(text: "「Re:paint」を正しくご利用していただくために、"),
          TextSpan(text: "通知", style: boldStyle),
          const TextSpan(text: "と"),
          TextSpan(text: "位置情報", style: boldStyle),
          const TextSpan(text: "の使用の許可する必要があります。\n\n「進む」を押した後に許可をお願いしいたします。"),
        ],
      ),
    );
  }
}

@RoutePage()
class IntroductionWelcomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          FlatIconButton(
            onPressed: () {
              context.pushRoute(const IntroductionSettingsRoute());
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
              constraints: const BoxConstraints(maxHeight: 480.0),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset("assets/repaint.png"),
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
            WideElevatedButton(
              onPressed: () async {
                await permissions.request();
                if (context.mounted) {
                  context.pushRoute(const IntroductionExplainRoute());
                }
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
