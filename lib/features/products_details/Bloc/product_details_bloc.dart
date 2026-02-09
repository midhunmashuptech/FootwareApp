import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/common/app_colors.dart';
import 'package:footware_app/features/common/model/footware_model.dart';
import 'package:footware_app/features/common/model/rating_model.dart';
import 'package:footware_app/features/products_details/model/user_review_model.dart';

import 'product_details_event.dart';
import 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(ProductDetailsInitial()) {
    on<LoadProductDetails>(_onLoadProductDetails);
    on<UpdateRating>(_onUpdateRating);
    on<UpdateReview>(_onUpdateReview);
    on<SubmitReview>(_onSubmitReview);
  }

  void _onLoadProductDetails(
    LoadProductDetails event,
    Emitter<ProductDetailsState> emit,
  ) {
    emit(
      ProductDetailsLoaded(
        features: const [
          {
            'icon': Icons.trending_up,
            'color': AppColors.lightBlue,
            'text': 'Casual and trendy',
          },
          {
            'icon': Icons.sentiment_satisfied_alt,
            'color': AppColors.darkGreen,
            'text': '1000+ customers',
          },
          {
            'icon': Icons.directions_walk,
            'color': AppColors.ratingOrange,
            'text': 'Secure Lace up Closure',
          },
        ],
        description:
            "These running shoes are designed for everyday comfort with a stylish look.",
        similarProducts: [
          FootwareModel(
            title: "Running Shoes",
            description: "Comfortable running shoes",
            image:
                "https://static.vecteezy.com/system/resources/previews/046/407/753/non_2x/unique-and-aesthetically-colorful-details-of-the-upper-mesh-yellow-premium-running-sports-shoes-sneakers-isolated-on-a-transparent-background-png.png",
            price: 1999,
            category: "Sports",
            rating: RatingModel(rating: 4.5, reviews: "120"),
          ),
        ],
        averageRating: 4.2,
        totalReviews: 2,
        userReviews: [
          UserReviewModel(
            userName: "Keerthana M.B",
            userImage:
                "https://static.vecteezy.com/system/resources/thumbnails/041/642/167/small_2x/ai-generated-portrait-of-handsome-smiling-young-man-with-folded-arms-isolated-free-png.png",
            rating: 4.5,
            reviewTime: "2 days ago",
            reviewTitle: "Excellent Product",
            reviewText: "Very comfortable shoes",
          ),
          UserReviewModel(
            userName: "Anjana R",
            userImage:
                "https://static.vecteezy.com/system/resources/thumbnails/041/642/167/small_2x/ai-generated-portrait-of-handsome-smiling-young-man-with-folded-arms-isolated-free-png.png",
            rating: 4.0,
            reviewTime: "5 days ago",
            reviewTitle: "Nice",
            reviewText: "Worth the price",
          ),
        ],
      ),
    );
  }

  void _onUpdateRating(
    UpdateRating event,
    Emitter<ProductDetailsState> emit,
  ) {
    final current = state as ProductDetailsLoaded;
    if (!current.reviewSubmitted) {
      emit(current.copyWith(userRating: event.rating));
    }
  }

  void _onUpdateReview(
    UpdateReview event,
    Emitter<ProductDetailsState> emit,
  ) {
    final current = state as ProductDetailsLoaded;
    if (!current.reviewSubmitted) {
      emit(current.copyWith(userReview: event.review));
    }
  }

  void _onSubmitReview(
    SubmitReview event,
    Emitter<ProductDetailsState> emit,
  ) {
    final current = state as ProductDetailsLoaded;

    final newReview = UserReviewModel(
      userName: "You",
      userImage:
          "https://static.vecteezy.com/system/resources/thumbnails/041/642/167/small_2x/ai-generated-portrait-of-handsome-smiling-young-man-with-folded-arms-isolated-free-png.png",
      rating: current.userRating.toDouble(),
      reviewTime: "Just now",
      reviewTitle: "User Review",
      reviewText: current.userReview,
    );

    final updatedReviews = [newReview, ...current.userReviews];

    final newTotal = current.totalReviews + 1;
    final newAverage =
        ((current.averageRating * current.totalReviews) +
                current.userRating) /
            newTotal;

    emit(
      current.copyWith(
        userReviews: updatedReviews,
        totalReviews: newTotal,
        averageRating: double.parse(newAverage.toStringAsFixed(1)),
        reviewSubmitted: true,
      ),
    );
  }
}
