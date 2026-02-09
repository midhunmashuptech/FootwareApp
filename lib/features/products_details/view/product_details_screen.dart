import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/common/app_colors.dart';
import 'package:footware_app/features/common/widget/footwear_card.dart';
import 'package:footware_app/features/products_details/bloc/product_details_bloc.dart';
import 'package:footware_app/features/products_details/bloc/product_details_event.dart';
import 'package:footware_app/features/products_details/bloc/product_details_state.dart';
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
          "Love these shoes! Very soft inside, light on the feet, and comfortable even after wearing for hours.",
    ),
    UserReviewModel(
      userName: "Anjana R",
      userImage:
          "https://static.vecteezy.com/system/resources/thumbnails/041/642/167/small_2x/ai-generated-portrait-of-handsome-smiling-young-man-with-folded-arms-isolated-free-png.png",
      rating: 4.0,
      reviewTime: "5 days ago",
      reviewTitle: "Very Comfortable",
      reviewText:
          "Good quality and comfortable fit. Worth the price.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ProductDetailsBloc()..add(LoadProductDetails()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Product Details"),
          leading: const BackButton(),
        ),
        body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsLoaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🔹 Product Highlights
                    const Text(
                      "Product Highlights",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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

                    /// 🔹 Description
                    const Text(
                      "Description",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Text(state.description),

                    const SizedBox(height: 24),

                    /// 🔹 Ratings
                    const Text(
                      "Ratings & Reviews",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),

                    ReviewFeildWidget(
                      rating: state.averageRating,
                      reviews: state.totalReviews,
                    ),

                    const SizedBox(height: 16),

                    /// 🔹 User Reviews
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: userReviews.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: 12),
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

                    /// 🔹 Similar Products
                    const Text(
                      "Explore more like this",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                      itemCount: state.similarProducts.length,
                      itemBuilder: (context, index) {
                        final item = state.similarProducts[index];
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

        /// 🔹 Bottom Buttons
        bottomNavigationBar: Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          color: AppColors.primaryWhite,
          child: SafeArea(
            top: false,
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: AppColors.primaryBlack),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Add to cart",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: AppColors.primaryBlack,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Buy @5999",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
