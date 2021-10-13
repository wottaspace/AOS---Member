class Complaint {
  Complaint({
    required this.createdOn,
    required this.details,
    required this.id,
    required this.jobId,
    required this.status,
    required this.submittedBy,
    required this.title,
  });

  String createdOn;
  String details;
  int id;
  int jobId;
  String status;
  int submittedBy;
  String title;

  String get createdAt => createdOn.split(" ").reversed.skip(2).toList().reversed.join(" ");

  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
      createdOn: json["created_on"],
      details: json["details"],
      id: json["id"],
      jobId: json["job_id"],
      status: json["status"],
      submittedBy: json["submitted_by"],
      title: json["title"],
    );
  }
}
