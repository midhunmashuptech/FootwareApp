import 'package:footware_app/features/common/model/footware_model.dart';
import 'package:footware_app/features/products_details/model/user_review_model.dart';

abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
  final int id;
  final List<List<String>> images;
  final List<String> sizes;
  final List<Map<String, dynamic>> details;
  final List<Map<String, dynamic>> features;
  final String title;
  final String description;
  final List<FootwareModel> similarProducts;

  final double averageRating;
  final int totalReviews;

  // Review form
  final int userRating;
  final String userReview;
  final bool reviewSubmitted;

  // Reviews list
  final List<UserReviewModel> userReviews;

  ProductDetailsLoaded({
    required this.id,
    required this.images,
    required this.sizes,
    required this.details,
    required this.features,
    required this.title,
    required this.description,
    required this.similarProducts,
    required this.averageRating,
    required this.totalReviews,
    required this.userReviews,
    this.userRating = 0,
    this.userReview = '',
    this.reviewSubmitted = false,
  });

  ProductDetailsLoaded copyWith({
    int? userRating,
    String? userReview,
    bool? reviewSubmitted,
    List<UserReviewModel>? userReviews,
    double? averageRating,
    int? totalReviews,
  }) {
    return ProductDetailsLoaded(
      id: id,
      images: images,
      sizes: sizes,
      details: details,
      features: features,
      title: title,
      description: description,
      similarProducts: similarProducts,
      averageRating: averageRating ?? this.averageRating,
      totalReviews: totalReviews ?? this.totalReviews,
      userReviews: userReviews ?? this.userReviews,
      userRating: userRating ?? this.userRating,
      userReview: userReview ?? this.userReview,
      reviewSubmitted: reviewSubmitted ?? this.reviewSubmitted,
    );
  }
}
