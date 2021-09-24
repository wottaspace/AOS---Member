import 'package:arcopen_employee/core/models/profile.dart';

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
}
