class Job {
  Job({
    required this.address,
    this.applicantsCount,
    required this.applied,
    required this.biddingStarted,
    required this.budget,
    required this.businessName,
    required this.city,
    required this.createdAt,
    required this.enquirerCompany,
    required this.id,
    required this.jobCategory,
    required this.jobDescription,
    required this.jobType,
    required this.postedBy,
    this.profilePic,
    required this.saved,
    required this.shiftEndDate,
    required this.shiftEndTime,
    required this.shiftStartDate,
    required this.shiftStartTime,
    required this.shiftType,
    required this.updatedAt,
    this.instanceId,
  });

  String address;
  int? applicantsCount;
  bool applied;
  bool biddingStarted;
  String budget;
  String businessName;
  String city;
  String createdAt;
  String enquirerCompany;
  int id;
  String jobCategory;
  String jobDescription;
  String jobType;
  int? postedBy;
  String? profilePic;
  bool saved;
  String shiftEndDate;
  String shiftEndTime;
  String shiftStartDate;
  String shiftStartTime;
  String shiftType;
  String updatedAt;
  int? instanceId;

  String get startDate => shiftStartDate.split(" ").reversed.skip(2).toList().reversed.join(" ");
  String get endDate => shiftEndDate.split(" ").reversed.skip(2).toList().reversed.join(" ");
  String get creationDate => createdAt.split(" ").reversed.skip(2).toList().reversed.join(" ");

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      address: json["address"] ?? "Not defined",
      applicantsCount: json["applicants_count"],
      applied: json["applied"] ?? false,
      biddingStarted: json["bidding_started"] ?? false,
      budget: json["budget"] ?? "Not defined",
      businessName: json["business_name"],
      city: json["city"],
      createdAt: json["created_at"] ?? "Not defined",
      enquirerCompany: json["enquirer_company"] ?? json["company_name"] ?? "Not defined",
      id: json["id"] ?? json["job_id"],
      jobCategory: json["job_category"] ?? "Not defined",
      jobDescription: json["job_description"] ?? "Not defined",
      jobType: json["job_type"] ?? "Not defined",
      postedBy: json["posted_by"],
      instanceId: json["instance_id"],
      profilePic: json["profile_pic"],
      saved: json["saved"] ?? false,
      shiftEndDate: json["shift_end_date"] ?? "Not defined",
      shiftEndTime: json["shift_end_time"] ?? json["end_time"] ?? "Not defined",
      shiftStartDate: json["shift_start_date"],
      shiftStartTime: json["shift_start_time"] ?? json["start_time"] ?? "Not defined",
      shiftType: json["shift_type"] ?? "Day",
      updatedAt: json["updated_at"] ?? DateTime.now().toString(),
    );
  }
}
