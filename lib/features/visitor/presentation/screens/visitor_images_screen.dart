import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/topic.dart';
import 'package:repaint_mobile/features/visitor/providers/controller_providers.dart';
import 'package:repaint_mobile/features/visitor/providers/visitor_providers.dart';

@RoutePage()
class VisitorImagesScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visitorImages = ref.watch(visitorImagesProvider);
    final controller = ref.watch(visitorImagesControllerProvider.future);

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
      title: "画像の変更",
      scrollableChildren: [
        const Topic(text: "画像をタップすると変更できます", icon: Icons.lightbulb),
        const SizedBox(height: 16.0),
        ...visitorImages.maybeWhen(
          data: (data) => data!.entries.map(
            (image) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Material(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white,
                elevation: 1.0,
                child: InkWell(
                  onTap: () async =>
                      (await controller).onImagePressed(context, image.key),
                  borderRadius: BorderRadius.circular(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: CachedNetworkImage(
                            imageUrl: image.value,
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
