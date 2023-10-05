import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/introduction/providers/providers.dart';

@RoutePage()
class IntroductionHomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(introductionHomeControllerProvider);

    ref.listen(
      networkErrorProvider,
      (previous, next) {
        if (next != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(kDebugMode ? next.toString() : "通信エラー"),
            ),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          FlatIconButton(
            onPressed: () => controller.onSettingsPressed(context),
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
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 48.0,
                      vertical: 32.0,
                    ),
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Image.asset(
                        "assets/repaint.png",
                        frameBuilder:
                            (context, child, frame, wasSynchronouslyLoaded) {
                          if (wasSynchronouslyLoaded) {
                            return child;
                          }
                          return AnimatedOpacity(
                            opacity: frame == null ? 0 : 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut,
                            child: child,
                          );
                        },
                      ),
                    ),
                  ),
                  Text(
                    "Re:paintへようこそ!",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16.0),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child:
                        Text("このアプリは、イベント会場を回って撮った写真に色を付けていき、写真を完成させるアプリです。"),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: WideElevatedButton(
              onPressed: () => controller.onContinuePressed(context),
              text: "進む",
            ),
          ),
          const BottomPadding(),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
