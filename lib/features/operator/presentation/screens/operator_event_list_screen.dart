import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/topic.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/common/providers/api_providers.dart';
import 'package:repaint_mobile/features/operator/providers/controller_providers.dart';
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

    return ListScaffold(
      title: "イベント一覧",
      scrollableChildren: [
        const Topic(text: "管理するイベントを選択してください", icon: Icons.lightbulb),
        const SizedBox(height: 16.0),
        ...events.maybeWhen(
          data: (data) => data.isNotEmpty
              ? data
                  .map(
                    (event) => WideElevatedButton(
                      text: event.name,
                      onPressed: () async => (await controller)
                          .onEventItemPressed(context, token!, event.eventId),
                      colors: const WideElevatedButtonColors(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  )
                  .toList()
              : [
                  const Center(child: Text("管理できるイベントがありません")),
                ],
          orElse: () => [
            const Center(child: Stack(children: [CircularProgressIndicator()])),
          ],
        ),
      ],
    );
  }
}
