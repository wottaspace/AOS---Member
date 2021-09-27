import 'package:arcopen_employee/core/models/job.dart';

class PastJobsResponse {
  PastJobsResponse({
    required this.pastJobs,
  });

  List<Job> pastJobs;

  factory PastJobsResponse.fromJson(Map<String, dynamic> json) {
    return PastJobsResponse(
      pastJobs: List<Job>.from(json["past_jobs"].map((x) => Job.fromJson(x))),
    );
  }
}
