import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:repaint_mobile/config/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(RepaintApp()));
}

class RepaintApp extends StatelessWidget {
  RepaintApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
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
      routerConfig: _appRouter.config(),
    );
  }
}
