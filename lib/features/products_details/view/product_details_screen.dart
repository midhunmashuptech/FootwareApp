import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/common/app_colors.dart';
import 'package:footware_app/features/common/model/footware_model.dart';
import 'package:footware_app/features/common/model/rating_model.dart';
import 'package:footware_app/features/common/widget/footwear_card.dart';
import 'package:footware_app/features/products_details/cubit/product_details_cubit.dart';
import 'package:footware_app/features/products_details/cubit/product_details_state.dart';
import 'package:footware_app/features/products_details/model/user_review_model.dart';
import 'package:footware_app/features/products_details/widgets/product_feature_card.dart';
import 'package:footware_app/features/products_details/widgets/review_feild_widget.dart';
import 'package:footware_app/features/products_details/widgets/user_review_card.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  static final List<UserReviewModel> userReviews = [
    UserReviewModel(
      userName: "Keerthana M.B",
      userImage:
          "https://static.vecteezy.com/system/resources/thumbnails/041/642/167/small_2x/ai-generated-portrait-of-handsome-smiling-young-man-with-folded-arms-isolated-free-png.png",
      rating: 4.5,
      reviewTime: "2 days ago",
      reviewTitle: "Excellent Product",
      reviewText:
          "Love these shoes! Very soft inside, light on the feet, and comfortable even after wearing for hours. Looks trendy and feels premium.",
    ),
    UserReviewModel(
      userName: "Anjana R",
      userImage:
          "https://static.vecteezy.com/system/resources/thumbnails/041/642/167/small_2x/ai-generated-portrait-of-handsome-smiling-young-man-with-folded-arms-isolated-free-png.png",
      rating: 4.0,
      reviewTime: "5 days ago",
      reviewTitle: "Very Comfortable",
      reviewText:
          "Good quality and comfortable fit. Worth the price. Delivery was fast too.",
    ),
    UserReviewModel(
      userName: "Sreejith K",
      userImage:
          "https://static.vecteezy.com/system/resources/thumbnails/041/642/167/small_2x/ai-generated-portrait-of-handsome-smiling-young-man-with-folded-arms-isolated-free-png.png",
      rating: 3.5,
      reviewTime: "1 week ago",
      reviewTitle: "Decent Shoes",
      reviewText:
          "The shoes are fine for daily use, but the sole could be a bit better.",
    ),
  ];

  //custom list for footwears
  static List<FootwareModel> footwearList = [
    FootwareModel(
      title: "Nike Air Max 270",
      description:
          "Lightweight running shoes with breathable mesh and cushioned sole for all-day comfort.",
      image:
          "https://static.vecteezy.com/system/resources/thumbnails/046/323/369/small_2x/pair-of-stylish-green-and-gray-running-shoes-for-athletics-png.png",
      rating: RatingModel(rating: 4.6, reviews: "2.3k"),
      price: 8999,
      category: "Running",
      isLiked: "true",
    ),
    FootwareModel(
      title: "Adidas Ultraboost",
      description:
          "High-performance running shoes with responsive cushioning and premium knit upper.",
      image:
          "https://static.vecteezy.com/system/resources/previews/046/407/753/non_2x/unique-and-aesthetically-colorful-details-of-the-upper-mesh-yellow-premium-running-sports-shoes-sneakers-isolated-on-a-transparent-background-png.png",
      rating: RatingModel(rating: 4.8, reviews: "1.8k"),
      price: 11999,
      category: "Running",
      isLiked: "false",
    ),
    FootwareModel(
      title: "Puma RS-X",
      description:
          "Trendy sneakers with bold design, perfect for casual wear and daily styling.",
      image:
          "https://static.vecteezy.com/system/resources/previews/046/407/753/non_2x/unique-and-aesthetically-colorful-details-of-the-upper-mesh-yellow-premium-running-sports-shoes-sneakers-isolated-on-a-transparent-background-png.png",
      rating: RatingModel(rating: 4.3, reviews: "950"),
      price: 7499,
      category: "Casual",
      isLiked: "false",
    ),
    FootwareModel(
      title: "Reebok Classic Leather",
      description:
          "Timeless leather sneakers with durable outsole and cushioned comfort.",
      image:
          "https://static.vecteezy.com/system/resources/previews/046/407/753/non_2x/unique-and-aesthetically-colorful-details-of-the-upper-mesh-yellow-premium-running-sports-shoes-sneakers-isolated-on-a-transparent-background-png.png",
      rating: RatingModel(rating: 4.2, reviews: "1.2k"),
      price: 6799,
      category: "Casual",
      isLiked: "true",
    ),
    FootwareModel(
      title: "Bata Power Running Shoes",
      description:
          "Affordable and durable running shoes suitable for daily workouts and jogging.",
      image:
          "https://static.vecteezy.com/system/resources/thumbnails/046/323/369/small_2x/pair-of-stylish-green-and-gray-running-shoes-for-athletics-png.png",
      rating: RatingModel(rating: 4.0, reviews: "720"),
      price: 2999,
      category: "Sports",
      isLiked: "false",
    ),
    FootwareModel(
      title: "Bata Power Running Shoes",
      description:
          "Affordable and durable running shoes suitable for daily workouts and jogging.",
      image:
          "https://static.vecteezy.com/system/resources/thumbnails/046/323/369/small_2x/pair-of-stylish-green-and-gray-running-shoes-for-athletics-png.png",
      rating: RatingModel(rating: 4.0, reviews: "720"),
      price: 2999,
      category: "Sports",
      isLiked: "false",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDetailsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Product Details"),
          leading: const BackButton(),
        ),
        body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsLoaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Product Highlights",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: state.features
                          .map(
                            (item) => ProductFeatureCard(
                              icon: item['icon'],
                              iconColor: item['color'],
                              text: item['text'],
                            ),
                          )
                          .toList(),
                    ),

                    const SizedBox(height: 24),
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(state.description),

                    const SizedBox(height: 24),
                    const Text(
                      "Ratings & Reviews",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    ReviewFeildWidget(
                      rating: state.averageRating,
                      reviews: state.totalReviews,
                    ),

                    const SizedBox(height: 16),

                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: userReviews.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final review = userReviews[index];
                        return UserReviewCard(
                          userName: review.userName,
                          userImage: review.userImage,
                          rating: review.rating,
                          reviewTime: review.reviewTime,
                          reviewTitle: review.reviewTitle,
                          reviewText: review.reviewText,
                        );
                      },
                    ),

                    const SizedBox(height: 24),
                    const Text(
                      "Explore more like this",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 14,
                            childAspectRatio: 0.8,
                          ),
                      itemCount: footwearList.length,
                      itemBuilder: (context, index) {
                        final item = footwearList[index];
                        return FootwearCard(
                          imageUrl: item.image,
                          name: item.title,
                          rating: item.rating.rating,
                          reviews: item.rating.reviews,
                          price: item.price,
                          onWishlistTap: () {},
                        );
                      },
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),

        //Container with buttons
        bottomNavigationBar: Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          decoration: BoxDecoration(color: AppColors.primaryWhite),
          child: SafeArea(
            top: false,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Add to cart",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Buy @5999",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
