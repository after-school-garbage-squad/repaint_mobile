import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';

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
          // https://github.com/flutter/flutter/issues/118965
          const SizedBox(width: 16.0),
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 480.0),
                        child: Image.asset("assets/repaint.png"),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      "Re:paintへようこそ!",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16.0),
                    const Text("Re:paintの説明文"), // TODO: 説明文を書く
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: WideElevatedButton(
              onPressed: () {
                context.pushRoute(const IntroductionStepperRoute());
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
