import 'package:arcopen_employee/http/responses/get_finances_response.dart';
import 'package:arcopen_employee/utils/repositories/base_repository.dart';
import 'package:dio/dio.dart';

class FinancesRepository extends BaseRepository {
  final String basePath = "/jobs/api";

  Future<GetFinancesResponse> getFinances() async {
    try {
      final Response response = await client.get(path: "$basePath/getFinances/");
      return GetFinancesResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new Exception(this.extractErrorMessageFromDioError(e));
    }
  }
}
