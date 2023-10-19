import 'dart:ui';

import 'package:logging/logging.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'visitor_providers.g.dart';

bool isImageRenewable = true;

@Riverpod(dependencies: [apiClient, VisitorUser])
Stream<String?> visitorSelectedImage(VisitorSelectedImageRef ref) async* {
  final logger = Logger("VisitorSelectedImageProvider");
  final visitorApi = ref.watch(apiClientProvider).getVisitorApi();
  final visitorIdentification = await ref.watch(
    visitorUserProvider
        .selectAsync((data) => data.visitor?.visitorIdentification),
  );

  while (true) {
    if (visitorIdentification != null) {
      final lifecycle = ref.read(appLifecycleProvider);
      logger.info("lifecycle: $lifecycle");
      final isUpdated = lifecycle == AppLifecycleState.resumed &&
          (isImageRenewable ||
              (await visitorApi.checkUpdate(
                    visitorId: visitorIdentification.visitorId,
                    eventId: visitorIdentification.eventId,
                  ))
                      .data
                      ?.isUpdated ==
                  true);

      logger.info("isUpdated: $isUpdated");

      if (isUpdated) {
        final imageId = (await visitorApi.getCurrentImage(
          visitorId: visitorIdentification.visitorId,
          eventId: visitorIdentification.eventId,
        ))
            .data
            ?.imageId;

        if (imageId != null) {
          ref.read(visitorUserProvider.notifier).updateImageId((p0) => imageId);
        }

        final imageUrl = imageId != null
            ? await visitorApi
                .getCurrentImageURL(
                  visitorId: visitorIdentification.visitorId,
                  eventId: visitorIdentification.eventId,
                  visitorImageId: imageId,
                )
                .then((value) => value.data?.url)
            : null;

        final isCompleted = await visitorApi
            .isPaletteCompleted(
              visitorId: visitorIdentification.visitorId,
              eventId: visitorIdentification.eventId,
            )
            .then((value) => value.data?.isCompleted);

        logger.info("imageUrl: $imageUrl, isCompleted: $isCompleted");

        await ref
            .read(visitorUserProvider.notifier)
            .setIsCompleted((p0) => isCompleted ?? p0);

        if (isImageRenewable) {
          isImageRenewable = false;
        }

        yield imageUrl;
      }
    }

    await Future.delayed(const Duration(seconds: 5));
  }
}

@Riverpod(dependencies: [VisitorUser, apiClient])
Future<List<GetVisitorImages200ResponseImagesInner>> visitorImages(
  VisitorImagesRef ref,
) async {
  final apiClient = ref.watch(apiClientProvider);
  final user = await ref.watch(visitorUserProvider.future);

  if (user.visitor == null) return [];
  final images = (await apiClient.getVisitorApi().getVisitorImages(
            visitorId: user.visitor!.visitorIdentification.visitorId,
            eventId: user.visitor!.visitorIdentification.eventId,
          ))
      .data
      ?.images;

  return images ?? [];
}

@Riverpod(keepAlive: true)
class VisitorSpotBonusState extends _$VisitorSpotBonusState {
  @override
  bool build() => false;

  @override
  set state(bool value) {
    super.state = value;
  }
}
