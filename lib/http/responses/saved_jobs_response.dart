import 'package:arcopen_employee/core/models/job.dart';

class SavedJobsResponse {
  SavedJobsResponse({
    required this.jobs,
  });

  List<Job> jobs;

  factory SavedJobsResponse.fromJson(Map<String, dynamic> json) {
    return SavedJobsResponse(
      jobs: List<Job>.from(json["jobs"].map((x) => Job.fromJson(x))),
    );
  }
}
