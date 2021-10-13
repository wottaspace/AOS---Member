class Review {
  Review({
    required this.id,
    required this.profilePic,
    required this.rating,
    required this.text,
  });

  int id;
  String profilePic;
  String rating;
  String text;

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json["id"],
      profilePic: json["profile_pic"],
      rating: json["rating"],
      text: json["text"],
    );
  }
}
