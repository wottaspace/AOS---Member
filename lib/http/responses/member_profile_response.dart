class MemberProfileResponse {
  MemberProfileResponse({
    required this.profile,
    required this.reviews,
  });

  Profile profile;
  List<dynamic> reviews;

  factory MemberProfileResponse.fromJson(Map<String, dynamic> json) => MemberProfileResponse(
        profile: Profile.fromJson(json["profile"]),
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "profile": profile.toJson(),
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
      };
}

class Profile {
  Profile({
    required this.about,
    required this.address,
    required this.availabilityDates,
    required this.badgeNumber,
    required this.city,
    required this.contact,
    required this.createdAt,
    required this.documentName,
    required this.drive,
    required this.hourlyRate,
    required this.id,
    required this.name,
    required this.postalCode,
    required this.profilePic,
    required this.updatedAt,
  });

  String about;
  String address;
  String availabilityDates;
  String badgeNumber;
  String city;
  String contact;
  String createdAt;
  String documentName;
  String drive;
  String hourlyRate;
  String id;
  String name;
  String postalCode;
  String profilePic;
  String updatedAt;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        about: json["about"],
        address: json["address"],
        availabilityDates: json["availability_dates"],
        badgeNumber: json["badge_number"],
        city: json["city"],
        contact: json["contact"],
        createdAt: json["created_at"],
        documentName: json["document_name"],
        drive: json["drive"],
        hourlyRate: json["hourly_rate"],
        id: json["id"],
        name: json["name"],
        postalCode: json["postal_code"],
        profilePic: json["profile_pic"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "about": about,
        "address": address,
        "availability_dates": availabilityDates,
        "badge_number": badgeNumber,
        "city": city,
        "contact": contact,
        "created_at": createdAt,
        "document_name": documentName,
        "drive": drive,
        "hourly_rate": hourlyRate,
        "id": id,
        "name": name,
        "postal_code": postalCode,
        "profile_pic": profilePic,
        "updated_at": updatedAt,
      };
}
