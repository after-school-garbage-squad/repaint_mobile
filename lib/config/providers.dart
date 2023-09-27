import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/guards.dart';
import 'package:repaint_mobile/features/common/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export '../features/common/providers/providers.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true, dependencies: [User])
Future<Raw<AppRouter>> appRouter(AppRouterRef ref) async => AppRouter(
      await ref.watch(userProvider.future),
      PermissionGuard(ref),
    );

Future<void> initializeProviders(ProviderContainer container) async {
  // await container.read(firebaseProvider.future);
  container.read(auth0Provider);
  await container.read(sharedPreferencesProvider.future);
  await container.read(localDataSourceProvider.future);
  await container.read(userProvider.future);
  await container.read(beaconStateProvider.future);
  await container.read(beaconStateProvider.notifier).startScan();
}
