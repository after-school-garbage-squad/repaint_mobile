import 'dart:async';

import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'visitor_providers.g.dart';

@Riverpod()
Stream<String?> visitorSelectedImage(VisitorSelectedImageRef ref) async* {
  final visitorApi = ref.watch(apiClientProvider).getVisitorApi();

  while (true) {
    final visitor = await ref.read(visitorUserProvider.future);

    final isUpdated = (await visitorApi.checkUpdate(
          visitorId: visitor.visitor!.visitorIdentification.visitorId,
          eventId: visitor.visitor!.visitorIdentification.eventId,
        ))
            .data
            ?.isUpdated ==
        true;

    if (isUpdated) {
      final imageId = (await visitorApi.getCurrentImage(
        visitorId: visitor.visitor!.visitorIdentification.visitorId,
        eventId: visitor.visitor!.visitorIdentification.eventId,
      ))
          .data
          ?.imageId;
      if (imageId != null) {
        await ref
            .read(visitorUserProvider.notifier)
            .updateImageId((p0) => imageId);
      }

      final imageUrl = imageId != null
          ? await visitorApi
              .getCurrentImageURL(
                visitorId: visitor.visitor!.visitorIdentification.visitorId,
                eventId: visitor.visitor!.visitorIdentification.eventId,
                visitorImageId: imageId,
              )
              .then((value) => value.data?.url)
          : null;

      yield imageUrl;
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
