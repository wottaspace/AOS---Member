class Transaction {
  Transaction({
    required this.amountPaid,
    required this.applicationId,
    required this.businessName,
    required this.jobId,
    required this.jobType,
    required this.memberName,
    required this.month,
    required this.paymentDate,
    required this.paymentStatus,
    required this.profilePic,
    required this.stars,
    required this.transactionId,
  });

  String amountPaid;
  int applicationId;
  String businessName;
  int jobId;
  String jobType;
  String memberName;
  String month;
  String? paymentDate;
  String? paymentStatus;
  String profilePic;
  double stars;
  int transactionId;

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      amountPaid: json["amount_paid"],
      applicationId: json["application_id"],
      businessName: json["business_name"],
      jobId: json["job_id"],
      jobType: json["job_type"],
      memberName: json["member_name"],
      month: json["month"],
      paymentDate: json["payment_date"],
      paymentStatus: json["payment_status"],
      profilePic: json["profile_pic"],
      stars: double.parse(json["stars"].toString()),
      transactionId: json["transaction_id"],
    );
  }
}
