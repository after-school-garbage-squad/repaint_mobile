import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repaint_mobile/bootstrap.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/providers.dart';

void main() async {
  runApp(
    UncontrolledProviderScope(
      container: await bootstrap(),
      child: const RepaintApp(),
    ),
  );
}

class RepaintApp extends ConsumerWidget {
  const RepaintApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = AppRouter(
      permissionGuard: ref.watch(permissionGuardProvider),
      visitorGuard: ref.watch(visitorGuardProvider),
      operatorGuard: ref.watch(operatorGuardProvider),
    );

    return MaterialApp.router(
      title: 'Re:paint',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0x00429cff),
          primary: const Color(0xff0079ff),
          primaryContainer: const Color(0xffc0deff),
          secondary: const Color(0xff9376e0),
          secondaryContainer: const Color(0xffada2ff),
          error: const Color(0xffff003d),
          surface: const Color(0xffd6d6d6),
          background: const Color(0xfff8f8f8),
        ),
        useMaterial3: true,
      ),
      routerConfig: appRouter.config(),
    );
  }
}
