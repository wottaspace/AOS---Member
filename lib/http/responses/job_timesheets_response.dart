import 'package:arcopen_employee/core/models/job.dart';

class JobTimesheetsResponse {
  JobTimesheetsResponse({
    required this.activeJob,
    required this.upcomingJobs,
  });

  List<Job> activeJob;
  List<Job> upcomingJobs;

  factory JobTimesheetsResponse.fromJson(Map<String, dynamic> json) {
    return JobTimesheetsResponse(
      activeJob: List<Job>.from(json["active_job"].map((x) => Job.fromJson(x))),
      upcomingJobs: List<Job>.from(json["upcoming_jobs"].map((x) => Job.fromJson(x))),
    );
  }
}
