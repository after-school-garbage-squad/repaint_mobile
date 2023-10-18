import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/config/app_router.dart';

void showNetworkErrorSnackBar(BuildContext context, DioException? error) {
  if (error == null) return;

  if (error.response?.statusCode == 401) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("再度ログインしてください"),
        action: SnackBarAction(
          label: "ログイン",
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            context.router.pushAndPopUntil(
              const IntroductionWelcomeRoute(),
              predicate: (_) => false,
            );
          },
        ),
        duration: const Duration(seconds: 3),
      ),
    );
    return;
  } else if(error.response?.statusCode == 422) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(kDebugMode ? error.toString() :  "QRコードの形式が違います\nRe:paintのQRコードをスキャンしてください"),
        action: SnackBarAction(
          label: "OK",
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }else if(error.response?.statusCode == 400) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(kDebugMode ? error.toString() :  "イベントが見つかりません\nQRコードを確認してください"),
          action: SnackBarAction(
            label: "OK",
            onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
          ),
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(kDebugMode ? error.toString() : "通信エラー"),
        action: SnackBarAction(
          label: "OK",
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

void showQRCodeErrorSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text(""),
      action: SnackBarAction(
        label: "OK",
        onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}
