import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager_dio/flutter_cache_manager_dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/domain/entities/qrcode_entity.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/app_dialog.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/material_banner.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/repaint_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/snackbar.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/topic.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/visitor/presentation/widgets/action_elevated_button.dart';

@RoutePage()
class VisitorHomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(visitorUserProvider);
    final imageUrl = ref.watch(visitorSelectedImageProvider);
    final controller = ref.watch(visitorHomeControllerProvider.future);

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

    return RepaintScaffold(
      title: "${user.value?.event?.name}",
      centerTitle: false,
      isBackButtonVisible: false,
      action: FlatIconButton(
        onPressed: () async => (await controller).onSettingsPressed(context),
        icon: Icons.settings,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  child: imageUrl.maybeWhen(
                    data: (data) => CachedNetworkImage(
                      useOldImageOnUrlChange: true,
                      cacheManager: DioCacheManager.instance,
                      imageUrl: data!,
                      fit: BoxFit.contain,
                      errorWidget: (context, url, error) => const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(width: 16.0),
                          Text("画像を処理しています..."),
                        ],
                      ),
                      placeholder: (context, url) => const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(width: 16.0),
                          Text("読み込んでいます..."),
                        ],
                      ),
                    ),
                    orElse: () => const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(width: 16.0),
                        Text("読み込んでいます..."),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ...[
              if (user.value?.isCompleted == true)
                Topic(
                  text: "全てのパレットを獲得し、画像が完成しました！",
                  icon: Icons.check,
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                ),
              const SizedBox(height: 16.0),
            ],
            const Topic(
              text: "スポットに近づいたり、QRを読み取ったりしてみましょう",
              icon: Icons.lightbulb,
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ActionElevatedButton(
                    onPressed: () async =>
                        (await controller).onShowQRCodePressed(context),
                    text: "参加者QRコードを\n表示する",
                    icon: Icons.qr_code,
                    colors: ActionElevatedButtonColors(
                      borderColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 24.0),
                Expanded(
                  child: ActionElevatedButton(
                    onPressed: () async =>
                        (await controller).onReadQRCodePressed(context),
                    text: "スポットQRコードを\n読み取る",
                    icon: Icons.qr_code_scanner,
                    colors: ActionElevatedButtonColors(
                      borderColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            WideElevatedButton(
              onPressed: () async =>
                  (await controller).onDownloadImagePressed(context),
              text: "画像の保存",
              icon: Icons.download,
              colors: const WideElevatedButtonColors(
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16.0),
            WideElevatedButton(
              onPressed: () async =>
                  (await controller).onChangeImagePressed(context),
              text: "画像の変更",
              icon: Icons.change_circle,
              colors: const WideElevatedButtonColors(
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16.0),
            WideElevatedButton(
              onPressed: () async => (await controller).onOpenEventPressed(),
              text: "イベントのHPを開く",
              icon: Icons.language,
              colors: const WideElevatedButtonColors(
                backgroundColor: Colors.white,
              ),
            ),
            const BottomPadding(),
          ],
        ),
      ),
    );
  }
}

class QRCodeViewDialog extends StatelessWidget {
  const QRCodeViewDialog(this.visitorIdentification);

  final VisitorIdentification visitorIdentification;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      children: [
        QrImageView(
          data: jsonEncode(
            VisitorQRCodeEntity(
              eventId: visitorIdentification.eventId,
              userId: visitorIdentification.visitorId,
            ).toJson(),
          ),
          size: 200,
          gapless: false,
        ),
        const SizedBox(height: 24.0),
        const Text("写真撮影の際にご掲示ください"),
      ],
    );
  }
}
