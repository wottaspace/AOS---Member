import 'package:arcopen_employee/http/network/network_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient with NetworkClient {
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
  }

  @override
  Future<Response> delete<D>({required String path}) {
    return _dio.delete(path);
  }

  @override
  Future get<Q>({required String path, Q? args}) {
    return _dio.get(path);
  }

  @override
  Future post<D>({required String path, D? args}) {
    return _dio.post(path, data: args);
  }

  @override
  Future put<D>({required String path, D? args}) {
    return _dio.put(path, data: args);
  }
}
