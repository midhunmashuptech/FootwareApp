import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/common/model/footware_model.dart';
import 'package:footware_app/features/common/model/rating_model.dart';
import 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial()) {
    loadProductDetails();
  }

  void loadProductDetails() {
    emit(
      ProductDetailsLoaded(
        features: const [
          {
            'icon': Icons.trending_up,
            'color': Colors.blue,
            'text': 'Casual and trendy',
          },
          {
            'icon': Icons.sentiment_satisfied_alt,
            'color': Colors.green,
            'text': '1000+ customers',
          },
          {
            'icon': Icons.directions_walk,
            'color': Colors.orange,
            'text': 'Secure Lace up Closure',
          },
        ],
        description:
            "These running shoes are designed for everyday comfort with a stylish look, durable lace-up closure, and lightweight feel for long-lasting wear.",
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
          FootwareModel(
            title: "Running Shoes",
            description: "Comfortable running shoes",
            image:
                "https://static.vecteezy.com/system/resources/previews/046/407/753/non_2x/unique-and-aesthetically-colorful-details-of-the-upper-mesh-yellow-premium-running-sports-shoes-sneakers-isolated-on-a-transparent-background-png.png",
            price: 1999,
            category: "Sports",
            rating: RatingModel(rating: 4.5, reviews: "120"),
          ),
          FootwareModel(
            title: "Casual Sneakers",
            description: "Stylish casual sneakers",
            image:
                "https://static.vecteezy.com/system/resources/thumbnails/046/323/369/small_2x/pair-of-stylish-green-and-gray-running-shoes-for-athletics-png.png",
            price: 1799,
            category: "Casual",
            rating: RatingModel(rating: 4.2, reviews: "85"),
          ),
        ],
        averageRating: 3.8,
        totalReviews: 86,
      ),
    );
  }
}
