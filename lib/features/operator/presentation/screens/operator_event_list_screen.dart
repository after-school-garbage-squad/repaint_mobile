import 'package:auto_route/annotations.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/material_banner.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/snackbar.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/topic.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/operator/providers/event_providers.dart';

@RoutePage()
class OperatorEventListScreen extends ConsumerWidget {
  const OperatorEventListScreen(@queryParam this.token);

  final String? token;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(operatorEventListProvider(token!));
    final controller = ref.watch(operatorEventListControllerProvider.future);

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

    FirebaseMessaging.onMessage.listen(
      (message) => showFCMMaterialBanner(context, message),
    );

    return ListScaffold(
      title: "イベント一覧",
      scrollableChildren: [
        const Topic(text: "管理するイベントを選択してください", icon: Icons.lightbulb),
        const SizedBox(height: 16.0),
        ...events.maybeWhen(
          data: (data) => data.isNotEmpty
              ? data
                  .map(
                    (event) => Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: WideElevatedButton(
                        text: event.name,
                        onPressed: () async => (await controller)
                            .onEventItemPressed(context, token!, event.eventId),
                        colors: const WideElevatedButtonColors(
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  )
                  .toList()
              : [
                  const Center(child: Text("管理できるイベントがありません")),
                ],
          orElse: () => [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 16),
                Text("イベントを取得中..."),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
