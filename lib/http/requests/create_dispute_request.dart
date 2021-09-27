import 'package:arcopen_employee/http/requests/base_request.dart';

class CreateDisputeRequest extends BaseRequest {
  CreateDisputeRequest({
    required this.title,
    required this.details,
    required this.jobId,
    required this.images,
  });

  String title;
  String details;
  String jobId;
  List<Map<String, String>> images;

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "details": details,
      "job_id": jobId,
      "images": images,
    };
  }
}
