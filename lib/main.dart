import 'package:flutter/material.dart';
import 'package:repaint_mobile/config/app_router.dart';

void main() {
  runApp(RepaintApp());
}

class RepaintApp extends StatelessWidget {
  RepaintApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
