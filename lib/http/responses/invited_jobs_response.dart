import 'package:arcopen_employee/core/models/job.dart';

class InvitedJobsResponse {
  InvitedJobsResponse({
    required this.jobs,
  });

  List<Job> jobs;

  factory InvitedJobsResponse.fromJson(Map<String, dynamic> json) {
    return InvitedJobsResponse(
      jobs: List<Job>.from(json["jobs"].map((x) => Job.fromJson(x))),
    );
  }
}
