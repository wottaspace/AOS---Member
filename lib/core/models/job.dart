class Job {
  Job({
    required this.address,
    required this.applicantsCount,
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
    required this.profilePic,
    required this.saved,
    required this.shiftEndDate,
    required this.shiftEndTime,
    required this.shiftStartDate,
    required this.shiftStartTime,
    required this.shiftType,
    required this.updatedAt,
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
  int postedBy;
  String? profilePic;
  bool saved;
  String shiftEndDate;
  String shiftEndTime;
  String shiftStartDate;
  String shiftStartTime;
  String shiftType;
  String updatedAt;

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      address: json["address"],
      applicantsCount: json["applicants_count"],
      applied: json["applied"],
      biddingStarted: json["bidding_started"],
      budget: json["budget"],
      businessName: json["business_name"],
      city: json["city"],
      createdAt: json["created_at"],
      enquirerCompany: json["enquirer_company"],
      id: json["id"],
      jobCategory: json["job_category"],
      jobDescription: json["job_description"],
      jobType: json["job_type"],
      postedBy: json["posted_by"],
      profilePic: json["profile_pic"],
      saved: json["saved"] ?? false,
      shiftEndDate: json["shift_end_date"],
      shiftEndTime: json["shift_end_time"],
      shiftStartDate: json["shift_start_date"],
      shiftStartTime: json["shift_start_time"],
      shiftType: json["shift_type"] ?? "Day",
      updatedAt: json["updated_at"],
    );
  }
}
