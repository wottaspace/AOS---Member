import 'package:arcopen_employee/http/responses/jobs_response.dart';
import 'package:arcopen_employee/utils/repositories/base_repository.dart';
import 'package:dio/dio.dart';

class JobsRepository extends BaseRepository {
  Future<JobsResponse> browseJobs() async {
    try {
      final Response response = await client.get(path: "/jobs/api/browseJobs");
      return JobsResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new Exception(this.extractErrorMessageFromDioError(e));
    }
  }
}
