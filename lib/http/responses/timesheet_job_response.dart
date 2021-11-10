import 'package:arcopen_employee/core/models/job.dart';

class TimesheetJobResponse {
  TimesheetJobResponse({
    required this.activeJob,
    required this.upcomingJobs,
  });

  List<Job> activeJob;
  List<UpcomingJob> upcomingJobs;

  factory TimesheetJobResponse.fromJson(Map<String, dynamic> json) => TimesheetJobResponse(
        activeJob: List<Job>.from(json["active_job"].map((x) => Job.fromJson(x))),
        upcomingJobs: List<UpcomingJob>.from(json["upcoming_jobs"].map((x) => UpcomingJob.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "active_job": List<dynamic>.from(activeJob.map((x) => x)),
        "upcoming_jobs": List<dynamic>.from(upcomingJobs.map((x) => x.toJson())),
      };
}

class UpcomingJob {
  UpcomingJob({
    required this.businessName,
    required this.companyLogo,
    required this.companyName,
    required this.daysRemaining,
    required this.jobId,
    required this.shiftStartDate,
  });

  String businessName;
  String companyLogo;
  String companyName;
  int daysRemaining;
  int jobId;
  String shiftStartDate;

  factory UpcomingJob.fromJson(Map<String, dynamic> json) => UpcomingJob(
        businessName: json["business_name"],
        companyLogo: json["company_logo"],
        companyName: json["company_name"],
        daysRemaining: json["days_remaining"],
        jobId: json["job_id"],
        shiftStartDate: json["shift_start_date"],
      );

  Map<String, dynamic> toJson() => {
        "business_name": businessName,
        "company_logo": companyLogo,
        "company_name": companyName,
        "days_remaining": daysRemaining,
        "job_id": jobId,
        "shift_start_date": shiftStartDate,
      };
}
