class SaveJobResponse {
  SaveJobResponse({
    required this.message,
    required this.status,
  });

  String message;
  String status;

  factory SaveJobResponse.fromJson(Map<String, dynamic> json) {
    return SaveJobResponse(
      message: json["message"],
      status: json["status"],
    );
  }
}
