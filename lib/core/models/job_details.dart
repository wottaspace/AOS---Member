class JobDetails {
  JobDetails({
    required this.address,
    required this.biddingStarted,
    required this.budget,
    required this.businessName,
    required this.city,
    required this.companyName,
    required this.createdAt,
    required this.employerName,
    required this.id,
    required this.jobCategory,
    required this.jobDescription,
    required this.jobType,
    required this.postedBy,
    required this.remainingDays,
    required this.shiftEndDate,
    required this.shiftEndTime,
    required this.shiftStartDate,
    required this.shiftStartTime,
    required this.updatedAt,
  });

  String address;
  bool biddingStarted;
  String budget;
  String businessName;
  String city;
  String companyName;
  String createdAt;
  String employerName;
  int id;
  String jobCategory;
  String jobDescription;
  String jobType;
  int postedBy;
  int remainingDays;
  String shiftEndDate;
  String shiftEndTime;
  String shiftStartDate;
  String shiftStartTime;
  String updatedAt;

  factory JobDetails.fromJson(Map<String, dynamic> json) {
    return JobDetails(
      address: json["address"],
      biddingStarted: json["bidding_started"],
      budget: json["budget"],
      businessName: json["business_name"],
      city: json["city"],
      companyName: json["company_name"],
      createdAt: json["created_at"],
      employerName: json["employer_name"],
      id: json["id"],
      jobCategory: json["job_category"],
      jobDescription: json["job_description"],
      jobType: json["job_type"],
      postedBy: json["posted_by"],
      remainingDays: json["remaining_days"],
      shiftEndDate: json["shift_end_date"],
      shiftEndTime: json["shift_end_time"],
      shiftStartDate: json["shift_start_date"],
      shiftStartTime: json["shift_start_time"],
      updatedAt: json["updated_at"],
    );
  }
}
