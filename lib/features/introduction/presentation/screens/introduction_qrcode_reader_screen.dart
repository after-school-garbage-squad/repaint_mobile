import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/camera_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';

@RoutePage()
class IntroductionQRCodeReaderScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 5)).then((_) async {
        await ref.read(userProvider.notifier).setType(UserType.visitor);
        if (context.mounted) {
          await context.router.pushAndPopUntil(
            const VisitorHomeRoute(),
            predicate: (_) => false,
          );
        }
      });
    });

    return CameraScaffold(
      preview: Expanded(
        child: MobileScanner(
          onDetect: (capture) async {
            // TODO: QRコードの内容を取得した際の処理を実装する
            await ref.read(userProvider.notifier).setType(UserType.visitor);
            if (context.mounted) {
              await context.router.pushAndPopUntil(
                const VisitorHomeRoute(),
                predicate: (_) => false,
              );
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
        const SizedBox(height: 20.0),
        const Text('カメラが起動しない場合は、設定から使用許可をお願いします'),
        const SizedBox(height: 20.0),
        const WideElevatedButton(
          onPressed: openAppSettings,
          text: "設定に進む",
          colors: WideElevatedButtonColors(
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
