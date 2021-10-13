import 'package:arcopen_employee/core/models/profile.dart';
import 'package:arcopen_employee/core/models/review.dart';

class MemberProfileResponse {
  MemberProfileResponse({
    required this.profile,
    required this.reviews,
  });

  Profile profile;
  List<Review> reviews;

  factory MemberProfileResponse.fromJson(Map<String, dynamic> json) {
    return MemberProfileResponse(
      profile: Profile.fromJson(json["profile"]),
      reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
    );
  }
}
