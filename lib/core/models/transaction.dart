class Transaction {
  Transaction({
    required this.id,
  });

  int id;

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json["id"],
    );
  }
}
