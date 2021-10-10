import 'package:arcopen_employee/core/models/job.dart';

class JobsResponse {
  JobsResponse({
    required this.jobs,
    required this.recommendedJobs,
  });

  List<Job> jobs;
  List<Job> recommendedJobs;

  factory JobsResponse.fromJson(Map<String, dynamic> json) {
    return JobsResponse(
      jobs: List<Job>.from(json["jobs"].map((x) => Job.fromJson(x))),
      recommendedJobs: json["recommended_jobs"] == null ? [] : List<Job>.from(json["recommended_jobs"].map((x) => Job.fromJson(x))),
    );
  }
}
