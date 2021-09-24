import 'package:arcopen_employee/http/requests/job_apply_request.dart';
import 'package:arcopen_employee/http/responses/jobs_response.dart';
import 'package:arcopen_employee/http/responses/save_job_response.dart';
import 'package:arcopen_employee/http/responses/saved_jobs_response.dart';
import 'package:arcopen_employee/utils/repositories/base_repository.dart';
import 'package:dio/dio.dart';

class JobsRepository extends BaseRepository {
  final String basePath = "/jobs/api";

  Future<JobsResponse> browseJobs() async {
    try {
      final Response response = await client.get(path: "$basePath/browseJobs");
      return JobsResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new Exception(this.extractErrorMessageFromDioError(e));
    }
  }

  Future applyForJob({required JobApplyRequest request}) async {
    try {
      final Response response = await client.post(path: "$basePath/applyJob/", args: request.toJson());
      print(response.data);
      return "ok";
    } on DioError catch (e) {
      throw new Exception(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<SavedJobsResponse> getSavedJobs() async {
    try {
      final Response response = await client.get(path: "$basePath/savedJobs/");
      return SavedJobsResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new Exception(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<SaveJobResponse> saveJob({required int jobId}) async {
    try {
      final Response response = await client.post(path: "$basePath/saveJob/", args: {
        "job_id": jobId,
      });
      return SaveJobResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new Exception(this.extractErrorMessageFromDioError(e));
    }
  }

  Future removeSavedJob({required int jobId}) async {
    try {
      final Response response = await client.delete(path: "$basePath/removeSavedJob/$jobId");
      print(response.data);
      return "ok";
    } on DioError catch (e) {
      throw new Exception(this.extractErrorMessageFromDioError(e));
    }
  }
}
