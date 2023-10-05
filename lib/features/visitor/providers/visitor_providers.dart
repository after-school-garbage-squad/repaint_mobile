import 'package:repaint_mobile/config/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'visitor_providers.g.dart';

@Riverpod(dependencies: [VisitorUser, apiClient])
Future<String?> visitorImage(VisitorImageRef ref) async {
  final apiClient = ref.watch(apiClientProvider);
  final user = await ref.watch(visitorUserProvider.future);
  if (user.visitorIdentification == null && user.imageId == null) return null;

  final update = await apiClient.getVisitorApi().checkUpdate(
        visitorId: user.visitorIdentification!.visitorId,
        eventId: user.visitorIdentification!.eventId,
      );
  if (update.data?.isUpdated != true) return null;

  final image = await apiClient.getVisitorApi().getCurrentImageURL(
        visitorId: user.visitorIdentification!.visitorId,
        eventId: user.visitorIdentification!.eventId,
        visitorImageId: user.imageId!,
      );
  return image.data?.url;
}

@Riverpod(dependencies: [VisitorUser, apiClient])
Future<Map<String, String>?> visitorImages(VisitorImagesRef ref) async {
  final apiClient = ref.watch(apiClientProvider);
  final user = await ref.watch(visitorUserProvider.future);

  if (user.visitorIdentification == null) return null;
  final imageIds = await apiClient.getVisitorApi().getVisitorImages(
        visitorId: user.visitorIdentification!.visitorId,
        eventId: user.visitorIdentification!.eventId,
      );

  if (imageIds.data?.images == null) return null;
  final images = <String, String>{};
  await Future.wait(
    imageIds.data!.images.map((imageId) async {
      final image = await apiClient.getVisitorApi().getCurrentImageURL(
            visitorId: user.visitorIdentification!.visitorId,
            eventId: user.visitorIdentification!.eventId,
            visitorImageId: imageId,
          );
      if (image.data?.url != null) {
        images[imageId] = image.data!.url;
      }
    }),
  );

  return images;
}
