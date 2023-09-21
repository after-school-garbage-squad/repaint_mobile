import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:openapi/openapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_providers.g.dart';

@Riverpod(keepAlive: true)
Openapi apiClient(ApiClientRef ref) {
  return Openapi(
    basePathOverride: dotenv.env['API_BASE_URL'],
    interceptors: [
      if (kDebugMode) LogInterceptor(requestBody: true, responseBody: true),
    ],
  );
}
