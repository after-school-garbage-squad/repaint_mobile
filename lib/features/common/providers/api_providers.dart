import 'package:dio/dio.dart';
import 'package:flutter_cache_manager_dio/flutter_cache_manager_dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_dio/sentry_dio.dart';

part 'api_providers.g.dart';

@Riverpod(keepAlive: true, dependencies: [NetworkError])
RepaintApiClient apiClient(ApiClientRef ref) {
  final client = RepaintApiClient(
    basePathOverride: dotenv.env['API_BASE_URL'],
    interceptors: [
      LogInterceptor(requestBody: true, responseBody: true),
      InterceptorsWrapper(
        onError: (error, handler) {
          if (error.requestOptions.uri.host == "image.asgs.dev") {
            isImageRenewable = true;
            handler.resolve(
              Response(requestOptions: error.requestOptions, statusCode: 404),
            );
          } else if (error.response?.statusCode == 409 &&
              error.requestOptions.uri.path.contains("pick")) {
            handler.resolve(
              Response(requestOptions: error.requestOptions, statusCode: 409),
            );
          } else {
            // ignore: avoid_manual_providers_as_generated_provider_dependency
            ref.read(networkErrorProvider.notifier).state = error;
            handler.next(error);
          }
        },
      ),
    ],
  );

  client.dio.addSentry();

  DioCacheManager.initialize(client.dio);

  return client;
}

@Riverpod(keepAlive: true, dependencies: [])
class NetworkError extends _$NetworkError {
  @override
  DioException? build() {
    return null;
  }

  @override
  set state(DioException? error) {
    super.state = error;
  }
}
