import 'package:repaint_mobile/config/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'visitor_providers.g.dart';

@Riverpod(dependencies: [VisitorUser])
Future<String?> visitorImage(VisitorImageRef ref) async {
  final apiClient = ref.watch(apiClientProvider);
  final user = await ref.watch(visitorUserProvider.future);

  if (user.visitorIdentification == null && user.imageId == null) return null;
  final image = await apiClient.getVisitorApi().getCurrentImageURL(
        visitorId: user.visitorIdentification!.visitorId,
        eventId: user.visitorIdentification!.eventId,
        visitorImageId: user.imageId!,
      );

  return image.data?.url;
}
