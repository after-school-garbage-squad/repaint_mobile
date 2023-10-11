import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_providers.g.dart';

@Riverpod(dependencies: [apiClient])
Future<List<Event>> operatorEventList(
  OperatorEventListRef ref,
  String token,
) async {
  final apiClient = ref.watch(apiClientProvider);
  final events = await apiClient
      .getAdminApi()
      .getEvents(headers: getAdminApiHeaders(token));
  return events.data ?? [];
}

@Riverpod(dependencies: [OperatorUser, apiClient])
Future<Event?> operatorEvent(OperatorEventRef ref) async {
  final apiClient = ref.watch(apiClientProvider);
  final user = await ref.watch(operatorUserProvider.future);
  if (user.token == null || user.eventId == null) return null;
  final events = await apiClient
      .getAdminApi()
      .getEvents(headers: getAdminApiHeaders(user.token!));
  final event =
      events.data?.firstWhere((element) => element.eventId == user.eventId);
  return event;
}

@Riverpod(dependencies: [apiClient, OperatorUser])
Future<Map<String, Spot>> operatorSpots(OperatorSpotsRef ref) async {
  final apiClient = ref.watch(apiClientProvider);
  final user = await ref.watch(operatorUserProvider.future);
  if (user.token == null) return {};

  final data = (await apiClient.getAdminApi().getSpots(
                eventId: user.eventId!,
                headers: getAdminApiHeaders(user.token!),
              ))
          .data ??
      [];
  final map = <String, Spot>{};
  for (final spot in data) {
    map[spot.beacon.hwId] = spot;
  }
  return map;
}
