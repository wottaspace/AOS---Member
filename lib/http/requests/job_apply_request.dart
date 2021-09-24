import 'package:arcopen_employee/http/requests/base_request.dart';

class JobApplyRequest extends BaseRequest {
  JobApplyRequest({
    required this.payExpected,
    required this.message,
    required this.jobId,
    required this.memberStatus,
  });

  String payExpected;
  String message;
  String jobId;
  String memberStatus;

  Map<String, dynamic> toJson() {
    return {
      "pay_expected": payExpected,
      "message": message,
      "job_id": jobId,
      "member_status": memberStatus,
    };
  }
}
