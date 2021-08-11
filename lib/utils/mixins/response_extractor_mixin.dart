import 'package:dio/dio.dart';

mixin ResponseExtractorMixin {
  String extractErrorMessageFromDioError(DioError error) {
    if (error.response == null) return "Can't connect to the internet, please try again later.";
    if (error.response?.data != null) {
      final Map<String, dynamic> responseData = error.response?.data as Map<String, dynamic>;
      if (responseData["error"] != null) {
        return responseData["error"];
      }
    } else {
      return error.message;
    }

    return error.message;
  }
}
