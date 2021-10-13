import 'package:arcopen_employee/core/models/job_details.dart';

class JobDetailsResponse {
  JobDetailsResponse({
    required this.jobDetails,
    required this.members,
    required this.membersCount,
  });

  JobDetails jobDetails;
  List<dynamic> members;
  int membersCount;

  factory JobDetailsResponse.fromJson(Map<String, dynamic> json) {
    return JobDetailsResponse(
      jobDetails: JobDetails.fromJson(json["job_details"]),
      members: List<dynamic>.from(json["members"].map((x) => x)),
      membersCount: json["members_count"],
    );
  }
}
