import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/camera_scaffold.dart';

@RoutePage()
class IntroductionQRCodeReaderScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logger = ref.watch(loggerProvider);

    return CameraScaffold(
      preview: Expanded(
        child: MobileScanner(
          onDetect: (capture) async {
            logger.d('QRコードを読み取りました: ${capture.barcodes.first.rawValue}');

            // TODO: QRコードの内容を取得した際の処理を実装する
            if (context.mounted) {
              context.router.pushAndPopUntil(
                const VisitorHomeRoute(),
                predicate: (_) => false,
              );
              await ref.read(userProvider.notifier).setType(UserType.visitor);
            }
          },
        ),
      ),
      children: [
        Text(
          "QRコードを読み取ってください",
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(overflow: TextOverflow.ellipsis),
        ),
        const SizedBox(height: 16.0),
        const Text('カメラが起動しない場合は、アプリを再起動してください'),
      ],
    );
  }
}
