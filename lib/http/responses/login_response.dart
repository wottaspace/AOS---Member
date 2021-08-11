class LoginResponse {
  LoginResponse({
    required this.accessToken,
    required this.profileExists,
    required this.user,
  });

  String accessToken;
  bool profileExists;
  User user;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        accessToken: json["access_token"],
        profileExists: json["profile_exists"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "profile_exists": profileExists,
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.badgeNumber,
    required this.createdAt,
    required this.deviceId,
    required this.deviceType,
    required this.email,
    required this.expiryDate,
    required this.hashcode,
    required this.id,
    required this.isVerified,
    required this.name,
    required this.password,
    required this.updatedAt,
    required this.userType,
  });

  String badgeNumber;
  DateTime createdAt;
  String deviceId;
  String deviceType;
  String email;
  DateTime expiryDate;
  dynamic hashcode;
  String id;
  bool isVerified;
  String name;
  String password;
  DateTime updatedAt;
  String userType;

  factory User.fromJson(Map<String, dynamic> json) => User(
        badgeNumber: json["badge_number"],
        createdAt: DateTime.parse(json["created_at"]),
        deviceId: json["device_id"],
        deviceType: json["device_type"],
        email: json["email"],
        expiryDate: DateTime.parse(json["expiry_date"]),
        hashcode: json["hashcode"],
        id: json["id"],
        isVerified: json["is_verified"],
        name: json["name"],
        password: json["password"],
        updatedAt: DateTime.parse(json["updated_at"]),
        userType: json["user_type"],
      );

  Map<String, dynamic> toJson() => {
        "badge_number": badgeNumber,
        "created_at": createdAt.toIso8601String(),
        "device_id": deviceId,
        "device_type": deviceType,
        "email": email,
        "expiry_date": "${expiryDate.year.toString().padLeft(4, '0')}-${expiryDate.month.toString().padLeft(2, '0')}-${expiryDate.day.toString().padLeft(2, '0')}",
        "hashcode": hashcode,
        "id": id,
        "is_verified": isVerified,
        "name": name,
        "password": password,
        "updated_at": updatedAt.toIso8601String(),
        "user_type": userType,
      };
}
