import 'package:arcopen_employee/http/network/clients/dio_client.dart';
import 'package:arcopen_employee/http/requests/login_request.dart';
import 'package:arcopen_employee/http/requests/register_request.dart';
import 'package:arcopen_employee/http/responses/login_response.dart';
import 'package:arcopen_employee/http/responses/register_response.dart';
import 'package:arcopen_employee/utils/repositories/base_repository.dart';
import 'package:dio/dio.dart';

class AuthRepository extends BaseRepository {
  final DioClient client = DioClient();

  Future<LoginResponse> login({required LoginRequest request}) async {
    try {
      final Response response = await client.post(path: "/login/", args: request.toJson());
      return LoginResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new Exception(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<RegisterResponse> register({required RegisterRequest request}) async {
    try {
      final Response response = await client.post(path: "/signup/", args: request.toJson());
      return RegisterResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new Exception(this.extractErrorMessageFromDioError(e));
    }
  }

  Future sendForgotPasswordRequest() async {}
  Future editPassword() async {}
  Future editProfile() async {}
}
