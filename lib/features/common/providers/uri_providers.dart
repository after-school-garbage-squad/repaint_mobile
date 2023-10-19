import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uni_links/uni_links.dart';

part 'uri_providers.g.dart';

@Riverpod(keepAlive: true)
class UriLink extends _$UriLink {
  static final _logger = Logger("UriLinkProvider");

  @override
  Future<Uri?> build() async {
    try {
      return getInitialUri();
    } on FormatException {
      _logger.warning("invalid initial uri");
    }

    return null;
  }
}

Future<void> joinEvent(Uri? uri, WidgetRef ref) async {
  final apiClient = ref.read(apiClientProvider);
  final eventId = uri?.queryParameters['event_id'];
  final registrationId = await ref.read(fcmRegistrationTokenProvider.future);
  if (eventId != null &&
      registrationId != null &&
      (await ref.read(commonUserProvider.future)).type == UserType.unknown) {
    final response = await apiClient.getVisitorApi().joinEvent(
          joinEventRequest: JoinEventRequest(
            eventId: eventId,
            registrationId: registrationId,
          ),
        );
    if (response.data != null) {
      await ref.read(visitorUserProvider.notifier).register(response.data!);
    }
  }
}
