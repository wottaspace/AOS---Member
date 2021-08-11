class RegisterResponse {
  RegisterResponse({
    required this.success,
  });

  String success;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
      };
}
