class Transaction {
  Transaction({
    required this.id,
    required this.businessName,
    required this.companyName,
    required this.createdAt,
  });

  int id;
  String companyName;
  String businessName;
  String createdAt;

  String get creationDate => createdAt.split(" ").reversed.skip(2).toList().reversed.join(" ");

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json["id"],
      businessName: json["business_name"],
      companyName: json["company_name"],
      createdAt: json["created_at"],
    );
  }
}
