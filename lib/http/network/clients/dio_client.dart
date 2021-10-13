import 'package:arcopen_employee/constants/app_constants.dart';
import 'package:arcopen_employee/http/network/network_client.dart';
import 'package:arcopen_employee/utils/helpers/k_storage.dart';
import 'package:arcopen_employee/utils/mixins/logging_mixin.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient with LoggingMixin implements NetworkClient {
  static final DioClient _singleton = DioClient._internal(dotenv.env["ENDPOINT"]!);
  final String baseUrl;

  factory DioClient() {
    return _singleton;
  }

  late Dio _dio;
  DioClient._internal(this.baseUrl) : super() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final String? accessToken = KStorage().read(key: AppConstants.accessTokenKey);
          if (accessToken != null) {
            options.headers.addAll({"Authorization": "Bearer $accessToken"});
          }
          options.headers.addAll({
            "Accept-Encoding": "gzip, deflate, br",
            "Accept": "application/json",
          });

          return handler.next(options);
        },
        onError: (e, handler) {
          logger.w(e.response, {
            "error": e.error,
          });
          return handler.next(e);
        },
      ),
    );

    _dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
  }

  @override
  Future<Response> delete({required String path}) {
    return _dio.delete(path);
  }

  @override
  Future get({required String path, args}) {
    return _dio.get(path);
  }

  @override
  Future post({required String path, args}) {
    return _dio.post(path, data: args);
  }

  @override
  Future put({required String path, args}) {
    return _dio.put(path, data: args);
  }
}
