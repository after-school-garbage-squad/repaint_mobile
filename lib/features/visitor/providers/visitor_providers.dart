import 'package:repaint_mobile/config/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'visitor_providers.g.dart';

@Riverpod(dependencies: [VisitorUser, apiClient])
Future<String?> visitorImage(VisitorImageRef ref) async {
  final apiClient = ref.watch(apiClientProvider);
  final visitor =
      await ref.watch(visitorUserProvider.selectAsync((data) => data.visitor));
  final imageId =
      await ref.watch(visitorUserProvider.selectAsync((data) => data.imageId));
  if (visitor == null && imageId == null) return null;

  final update = await apiClient.getVisitorApi().checkUpdate(
        visitorId: visitor!.visitorIdentification.visitorId,
        eventId: visitor.visitorIdentification.eventId,
      );

  if (update.data?.isUpdated == true || imageId == null) {
    final updatedImageId = await apiClient.getVisitorApi().getCurrentImage(
          visitorId: visitor.visitorIdentification.visitorId,
          eventId: visitor.visitorIdentification.eventId,
        );

    if (updatedImageId.data != null) {
      await ref
          .read(visitorUserProvider.notifier)
          .updateImageId((p0) => updatedImageId.data!.imageId);
      final imageUrl = await apiClient.getVisitorApi().getCurrentImageURL(
            visitorId: visitor.visitorIdentification.visitorId,
            eventId: visitor.visitorIdentification.eventId,
            visitorImageId: updatedImageId.data!.imageId,
          );
      return imageUrl.data?.url;
    }
  } else {
    final imageUrl = await apiClient.getVisitorApi().getCurrentImageURL(
          visitorId: visitor.visitorIdentification.visitorId,
          eventId: visitor.visitorIdentification.eventId,
          visitorImageId: imageId,
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
