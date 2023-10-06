import 'package:repaint_mobile/config/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'visitor_providers.g.dart';

@Riverpod(dependencies: [VisitorUser, apiClient])
Future<String?> visitorImage(VisitorImageRef ref) async {
  final apiClient = ref.watch(apiClientProvider);
  final user = await ref.watch(visitorUserProvider.future);
  if (user.visitor == null && user.imageId == null) return null;

  final update = await apiClient.getVisitorApi().checkUpdate(
        visitorId: user.visitor!.visitorIdentification.visitorId,
        eventId: user.visitor!.visitorIdentification.eventId,
      );
  if (update.data?.isUpdated == true || user.imageId == null) {
    final updatedImageId = await apiClient.getVisitorApi().getCurrentImage(
          visitorId: user.visitor!.visitorIdentification.visitorId,
          eventId: user.visitor!.visitorIdentification.eventId,
        );

    final updatedImageUrl = await apiClient.getVisitorApi().getCurrentImageURL(
          visitorId: user.visitor!.visitorIdentification.visitorId,
          eventId: user.visitor!.visitorIdentification.eventId,
          visitorImageId: updatedImageId.data!.imageId,
        );
    if (updatedImageUrl.data?.url != null) {
      await ref
          .read(visitorUserProvider.notifier)
          .updateImageId((p0) => updatedImageId.data!.imageId);
      return updatedImageUrl.data!.url;
    }
  } else {
    final imageUrl = await apiClient.getVisitorApi().getCurrentImageURL(
          visitorId: user.visitor!.visitorIdentification.visitorId,
          eventId: user.visitor!.visitorIdentification.eventId,
          visitorImageId: user.imageId!,
        );
    if (imageUrl.data?.url != null) {
      return imageUrl.data!.url;
    }
  }
  return null;
}

@Riverpod(dependencies: [VisitorUser, apiClient])
Future<Map<String, String>?> visitorImages(VisitorImagesRef ref) async {
  final apiClient = ref.watch(apiClientProvider);
  final user = await ref.watch(visitorUserProvider.future);

  if (user.visitor == null) return null;
  final imageIds = await apiClient.getVisitorApi().getVisitorImages(
        visitorId: user.visitor!.visitorIdentification.visitorId,
        eventId: user.visitor!.visitorIdentification.eventId,
      );

  if (imageIds.data?.images == null) return null;
  final images = <String, String>{};
  await Future.wait(
    imageIds.data!.images.map((imageId) async {
      final image = await apiClient.getVisitorApi().getCurrentImageURL(
            visitorId: user.visitor!.visitorIdentification.visitorId,
            eventId: user.visitor!.visitorIdentification.eventId,
            visitorImageId: imageId,
          );
      if (image.data?.url != null) {
        images[imageId] = image.data!.url;
      }
    }),
  );

  return images;
}
