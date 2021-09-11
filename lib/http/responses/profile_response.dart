class ProfileResponse {
  ProfileResponse({
    required this.profile,
    this.success,
  });

  Profile profile;
  String? success;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
        profile: Profile.fromJson(json["profile"]),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "profile": profile.toJson(),
        "success": success,
      };
}

class Profile {
  Profile({
    required this.about,
    required this.address,
    required this.badgeNumber,
    required this.city,
    required this.contact,
    required this.createdAt,
    required this.documents,
    required this.drive,
    required this.hourlyRate,
    required this.id,
    required this.pinLocation,
    required this.postalCode,
    required this.profilePic,
    required this.unavailability,
    required this.updatedAt,
    required this.userId,
  });

  String about;
  String address;
  String badgeNumber;
  String city;
  String contact;
  DateTime createdAt;
  String documents;
  bool drive;
  String hourlyRate;
  String id;
  dynamic pinLocation;
  String postalCode;
  String profilePic;
  String unavailability;
  DateTime updatedAt;
  String userId;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        about: json["about"],
        address: json["address"],
        badgeNumber: json["badge_number"],
        city: json["city"],
        contact: json["contact"],
        createdAt: DateTime.parse(json["created_at"]),
        documents: json["documents"],
        drive: json["drive"],
        hourlyRate: json["hourly_rate"],
        id: json["id"],
        pinLocation: json["pin_location"],
        postalCode: json["postal_code"],
        profilePic: json["profile_pic"],
        unavailability: json["unavailability"],
        updatedAt: DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "about": about,
        "address": address,
        "badge_number": badgeNumber,
        "city": city,
        "contact": contact,
        "created_at": createdAt.toIso8601String(),
        "documents": documents,
        "drive": drive,
        "hourly_rate": hourlyRate,
        "id": id,
        "pin_location": pinLocation,
        "postal_code": postalCode,
        "profile_pic": profilePic,
        "unavailability": unavailability,
        "updated_at": updatedAt.toIso8601String(),
        "user_id": userId,
      };
}
