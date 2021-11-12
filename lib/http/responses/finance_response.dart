import 'package:arcopen_employee/core/models/transaction.dart';

class FinanceResponse {
  FinanceResponse({
    required this.paidTransactions,
    required this.totalJobs,
    required this.totalPaid,
    required this.unpaidTransactions,
  });

  List<Transaction> paidTransactions;
  String totalJobs;
  String totalPaid;
  List<Transaction> unpaidTransactions;

  factory FinanceResponse.fromJson(Map<String, dynamic> json) {
    return FinanceResponse(
      paidTransactions: List<Transaction>.from(json["paid_transactions"].map((x) => Transaction.fromJson(x))),
      totalJobs: json["total_jobs"],
      totalPaid: json["total_paid"],
      unpaidTransactions: List<Transaction>.from(json["unpaid_transactions"].map((x) => Transaction.fromJson(x))),
    );
  }
}
