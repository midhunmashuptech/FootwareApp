class UserReviewModel {
  final String userName;
  final String userImage;
  final double rating;
  final String reviewTime;
  final String reviewTitle;
  final String reviewText;

  UserReviewModel({
    required this.userName,
    required this.userImage,
    required this.rating,
    required this.reviewTime,
    required this.reviewTitle,
    required this.reviewText,
  });
}
