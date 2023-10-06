import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/domain/entities/qrcode_entity.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/app_dialog.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/repaint_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/topic.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/visitor/presentation/widgets/action_elevated_button.dart';
import 'package:repaint_mobile/features/visitor/providers/providers.dart';

@RoutePage()
class VisitorHomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(visitorUserProvider);
    final imageUrl = ref.watch(visitorImageProvider);
    final controller = ref.watch(visitorHomeControllerProvider.future);

    return RepaintScaffold(
      isBackButtonVisible: false,
      action: FlatIconButton(
        onPressed: () async => (await controller).onSettingsPressed(context),
        icon: Icons.settings,
      ),
      child: user.maybeWhen(
        data: (data) => Column(
          children: [
            Expanded(
              child: imageUrl.maybeWhen(
                data: (data) => ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    imageUrl: data ?? "",
                    fit: BoxFit.contain,
                  ),
                ),
                orElse: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            const Topic(
              text: "スポットに近づいたり、QRを読み取ったりしてみましょう",
              icon: Icons.lightbulb,
            ),
            const SizedBox(height: 16.0),
            WideElevatedButton(
              onPressed: () async =>
                  (await controller).onDownloadImagePressed(context),
              text: "画像の保存",
              icon: Icons.group,
              colors: WideElevatedButtonColors(
                backgroundColor: Theme.of(context).colorScheme.surface,
              ),
            ),
            const SizedBox(height: 16.0),
            WideElevatedButton(
              onPressed: () async =>
                  (await controller).onChangeImagePressed(context),
              text: "画像の変更",
              icon: Icons.group,
              colors: WideElevatedButtonColors(
                backgroundColor: Theme.of(context).colorScheme.surface,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ActionElevatedButton(
                    onPressed: () async =>
                        (await controller).onShowQRCodePressed(context),
                    text: "QRコードの表示",
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
                    text: "QRコードの読取",
                    icon: Icons.qr_code_scanner,
                    colors: ActionElevatedButtonColors(
                      borderColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const BottomPadding(),
          ],
        ),
        orElse: () => const Center(child: CircularProgressIndicator()),
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
