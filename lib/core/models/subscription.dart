class Subscription {
  Subscription({
    required this.createdAt,
    required this.isActive,
    required this.isCancelled,
    required this.paymentStatus,
    required this.planId,
    required this.subscriptionId,
    required this.updatedAt,
    required this.user,
  });

  String createdAt;
  bool isActive;
  bool isCancelled;
  String paymentStatus;
  int planId;
  int subscriptionId;
  String updatedAt;
  int user;

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      createdAt: json["created_at"],
      isActive: json["is_active"],
      isCancelled: json["is_cancelled"],
      paymentStatus: json["payment_status"],
      planId: json["plan_id"],
      subscriptionId: json["subscription_id"],
      updatedAt: json["updated_at"],
      user: json["user"],
    );
  }
}
