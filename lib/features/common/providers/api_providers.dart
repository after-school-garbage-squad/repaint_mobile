import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_providers.g.dart';

@Riverpod(keepAlive: true)
RepaintApiClient apiClient(ApiClientRef ref) {
  return RepaintApiClient(
    basePathOverride: dotenv.env['API_BASE_URL'],
    interceptors: [
      if (kDebugMode) LogInterceptor(requestBody: true, responseBody: true),
    ],
  );
}
