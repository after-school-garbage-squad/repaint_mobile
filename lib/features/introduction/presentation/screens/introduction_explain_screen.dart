import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/config/app_router.dart';
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
          const TextSpan(text: "の使用の許可する必要があります。\n\n"),
        ],
      ),
    );
  }
}

@RoutePage()
class IntroductionExplainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            const SizedBox(width: 16.0),
            FlatIconButton(
              onPressed: context.popRoute,
              icon: Icons.chevron_left,
            ),
          ],
        ),
        leadingWidth: 64.0,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 32.0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      constraints: const BoxConstraints(maxHeight: 480.0),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset(
                          'assets/undraw_Mobile_app_re_catg.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const IntroductionWelcomeText(),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: WideElevatedButton(
              onPressed: () {
                context.pushRoute(const IntroductionQRCodeReaderRoute());
              },
              text: "進む",
            ),
          ),
          const BottomConstrainedPadding(),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
