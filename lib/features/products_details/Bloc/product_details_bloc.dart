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
        id: 21,
        title: "Softride Enzo Evo Women’s Lightweight Running Shoes",
        sizes: ["S", "M", "L", "XL", "XXL"],
        images: [
          [
            "https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/5/3/5324c8eNike-FN0228-110_1.jpg?rnd=20200526195200&tr=w-1080",
            "https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/5/3/5324c8eNike-FN0228-110_4.jpg?rnd=20200526195200&tr=w-1080",
            "https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/5/3/5324c8eNike-FN0228-110_5.jpg?rnd=20200526195200&tr=w-1080",
            "https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/5/3/5324c8eNike-FN0228-110_7.jpg?rnd=20200526195200&tr=w-1080",
            "https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/5/3/5324c8eNike-FN0228-110_8.jpg?rnd=20200526195200&tr=w-1080",
            "https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/5/3/5324c8eNike-FN0228-110_2.jpg?rnd=20200526195200&tr=w-1080",
          ],
          [
            "https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/5/3/5324c8eNike-FN0228-001_1.jpg?rnd=20200526195200&tr=w-1080",
            "https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/5/3/5324c8eNike-FN0228-001_4.jpg?rnd=20200526195200&tr=w-1080",
            "https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/5/3/5324c8eNike-FN0228-001_5.jpg?rnd=20200526195200&tr=w-1080",
            "https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/5/3/5324c8eNike-FN0228-001_7.jpg?rnd=20200526195200&tr=w-1080",
            "https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/5/3/5324c8eNike-FN0228-001_8.jpg?rnd=20200526195200&tr=w-1080",
            "https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/5/3/5324c8eNike-FN0228-001_2.jpg?rnd=20200526195200&tr=w-1080"
          ],
          [
            "https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/5/3/5324c8eNike-FN0228-302_1.jpg?rnd=20200526195200&tr=w-1080",
            "https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/5/3/5324c8eNike-FN0228-302_4.jpg?rnd=20200526195200&tr=w-1080",
            "https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/5/3/5324c8eNike-FN0228-302_5.jpg?rnd=20200526195200&tr=w-1080",
            "https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/5/3/5324c8eNike-FN0228-302_7.jpg?rnd=20200526195200&tr=w-1080",
          ],
          [
            "https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/5/3/5324c8eNike-FN0228-109_1.jpg?rnd=20200526195200&tr=w-1080",
            "https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/5/3/5324c8eNike-FN0228-109_4.jpg?rnd=20200526195200&tr=w-1080",
            "https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/5/3/5324c8eNike-FN0228-109_5.jpg?rnd=20200526195200&tr=w-1080",
            "https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/5/3/5324c8eNike-FN0228-109_7.jpg?rnd=20200526195200&tr=w-1080",
          ],
        ],
        details: const [
          {'label': 'Type', 'value': 'Formal'},
          {'label': 'Size', 'value': '6'},
          {'label': 'Material', 'value': 'Leather'},
          {'label': 'Color', 'value': 'Brown'},
          {'label': 'Heal Size', 'value': '2 inch'},
        ],
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
            "The Puma Softride Enzo Evo Women’s Lightweight Running Shoes are designed to deliver all-day comfort and supported performance whether you’re hitting the pavement or just walking around town. This product adds extra padded comfort underfoot, making these sneakers perfect",
        similarProducts: [
          FootwareModel(
            title: "RX - Swiss Training Shoe | Orange and White",
            description: "description",
            image:
                "https://static.vecteezy.com/system/resources/thumbnails/046/323/369/small_2x/pair-of-stylish-green-and-gray-running-shoes-for-athletics-png.png",
            rating: RatingModel(rating: 4.0, reviews: "7K+"),
            price: 2500,
            category: "Running",
          ),
          FootwareModel(
            title: "RX - Swiss Training Shoe | Yellow and Black",
            description: "description",
            image:
                "https://static.vecteezy.com/system/resources/thumbnails/046/323/598/small/pair-of-colorful-sports-shoes-for-active-lifestyle-png.png",
            rating: RatingModel(rating: 3.5, reviews: "12K+"),
            price: 3000,
            category: "Running",
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

  void _onUpdateRating(UpdateRating event, Emitter<ProductDetailsState> emit) {
    final current = state as ProductDetailsLoaded;
    if (!current.reviewSubmitted) {
      emit(current.copyWith(userRating: event.rating));
    }
  }

  void _onUpdateReview(UpdateReview event, Emitter<ProductDetailsState> emit) {
    final current = state as ProductDetailsLoaded;
    if (!current.reviewSubmitted) {
      emit(current.copyWith(userReview: event.review));
    }
  }

  void _onSubmitReview(SubmitReview event, Emitter<ProductDetailsState> emit) {
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
        ((current.averageRating * current.totalReviews) + current.userRating) /
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
