import 'package:arcopen_employee/core/models/complaint.dart';

class MemberDisputesResponse {
  MemberDisputesResponse({
    required this.complaints,
  });

  List<Complaint> complaints;

  factory MemberDisputesResponse.fromJson(Map<String, dynamic> json) {
    return MemberDisputesResponse(
      complaints: List<Complaint>.from(json["complaints"].map((x) => Complaint.fromJson(x))),
    );
  }
}
