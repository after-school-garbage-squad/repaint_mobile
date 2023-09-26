import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/repaint_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/introduction/providers/controller_providers.dart';

@RoutePage()
class IntroductionWelcomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(introductionWelcomeControllerProvider);

    return RepaintScaffold(
      isBackButtonVisible: false,
      action: FlatIconButton(
        onPressed: () => controller.onSettingsPressed(context),
        icon: Icons.settings,
      ),
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: WideElevatedButton(
              onPressed: () => controller.onContinuePressed(context),
              text: "進む",
            ),
          ),
          const BottomConstrainedPadding(),
        ],
      ),
    );
  }
}
