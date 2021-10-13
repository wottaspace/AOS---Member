import 'package:arcopen_employee/http/requests/change_password_request.dart';
import 'package:arcopen_employee/http/requests/login_request.dart';
import 'package:arcopen_employee/http/requests/register_request.dart';
import 'package:arcopen_employee/http/responses/login_response.dart';
import 'package:arcopen_employee/http/responses/member_profile_response.dart';
import 'package:arcopen_employee/http/responses/profile_response.dart';
import 'package:arcopen_employee/http/responses/register_response.dart';
import 'package:arcopen_employee/utils/repositories/base_repository.dart';
import 'package:dio/dio.dart';

class AuthRepository extends BaseRepository {
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

  Future<String> sendForgotPasswordRequest(data) async {
    try {
      final Response response = await client.post(path: "/forgotpassword/", args: data);
      return response.data["success"];
    } on DioError catch (e) {
      throw new Exception(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<MemberProfileResponse> readMemberProfile() async {
    try {
      final Response response = await client.get(path: "/memberProfile");
      return MemberProfileResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new Exception(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<ProfileResponse> createProfile({required FormData data}) async {
    try {
      final Response response = await client.post(path: "/profile/", args: data);
      return ProfileResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new Exception(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<ProfileResponse> updateProfile({required FormData data}) async {
    try {
      print(data.fields);
      final Response response = await client.put(path: "/profile/", args: data);
      return ProfileResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new Exception(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<LoginResponse> getLoggedUser() async {
    try {
      final Response response = await client.get(path: "/getLoggedInUser/");
      return LoginResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new Exception(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<String> changePassword({required ChangePasswordRequest request}) async {
    try {
      final Response response = await client.post(path: "/apiChangePassword/", args: request.toJson());
      return response.data["success"];
    } on DioError catch (e) {
      throw new Exception(this.extractErrorMessageFromDioError(e));
    }
  }
}
