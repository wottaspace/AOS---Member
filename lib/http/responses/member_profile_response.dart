import 'package:arcopen_employee/http/responses/profile_response.dart';

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
