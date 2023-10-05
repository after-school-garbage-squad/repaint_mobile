import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/config/app_router.dart';

void showNetworkErrorSnackBar(BuildContext context, DioException? error) {
  if (error == null) return;

  if (error.response?.statusCode == 401) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("再度ログインしてください"),
        action: SnackBarAction(
          label: "ログイン",
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            context.router.pushAndPopUntil(
              const IntroductionHomeRoute(),
              predicate: (_) => false,
            );
          },
        ),
      ),
    );
    return;
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(kDebugMode ? error.toString() : "通信エラー"),
        action: SnackBarAction(
          label: "OK",
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
      ),
    );
  }
}
