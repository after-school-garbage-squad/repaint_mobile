import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager_dio/flutter_cache_manager_dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/material_banner.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/snackbar.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/topic.dart';

@RoutePage()
class VisitorImagesScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visitorImages = ref.watch(visitorImagesProvider);
    final controller = ref.watch(visitorImagesControllerProvider.future);

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

    return ListScaffold(
      title: "画像の変更",
      scrollableChildren: [
        const Topic(text: "画像をタップすると変更できます", icon: Icons.lightbulb),
        const SizedBox(height: 16.0),
        ...visitorImages.maybeWhen(
          data: (data) => data.map(
            (image) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Material(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white,
                elevation: 1.0,
                child: InkWell(
                  onTap: () async =>
                      (await controller).onImagePressed(context, image.imageId),
                  borderRadius: BorderRadius.circular(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: CachedNetworkImage(
                            cacheManager: DioCacheManager.instance,
                            imageUrl: image.url,
                            imageBuilder: (context, imageProvider) {
                              return Image(
                                width: double.infinity,
                                image: imageProvider,
                                fit: BoxFit.cover,
                              );
                            },
                            placeholder: (context, url) => const Center(
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.error),
                                  SizedBox(width: 16.0),
                                  Text("エラーが発生しました"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          orElse: () => [
            const Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ],
    );
  }
}
