class Transaction {
  Transaction({required this.id, required this.businessName, required this.companyName});

  int id;
  String companyName;
  String businessName;

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json["id"],
      businessName: json["business_name"],
      companyName: json["company_name"],
    );
  }
}
