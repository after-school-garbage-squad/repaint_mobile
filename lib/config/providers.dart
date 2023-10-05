import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/guards.dart';
import 'package:repaint_mobile/features/common/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export '../features/common/providers/providers.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true, dependencies: [CommonUser])
Future<Raw<AppRouter>> appRouter(AppRouterRef ref) async => AppRouter(
      // ignore: avoid_manual_providers_as_generated_provider_dependency
      await ref.watch(commonUserProvider.future),
      PermissionGuard(ref),
    );

Future<void> initializeProviders(ProviderContainer container) async {
  await container.read(sharedPreferencesProvider.future);
  await container.read(localDataSourceProvider.future);
  await container.read(firebaseProvider.future);
  await container.read(firebaseClientIdProvider.future);
  await container.read(fcmRegistrationTokenProvider.future);
}
