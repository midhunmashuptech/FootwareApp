import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/common/widget/footwear_card.dart';
import 'package:footware_app/features/products_details/cubit/product_details_cubit.dart';
import 'package:footware_app/features/products_details/cubit/product_details_state.dart';
import 'package:footware_app/features/products_details/widgets/product_feature_card.dart';
import 'package:footware_app/features/products_details/widgets/review_feild_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

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
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Product Highlights",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),

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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Text(state.description),

                    const SizedBox(height: 24),

                    const Text(
                      "See Similar",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),

                    SizedBox(
                      height: 250,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.similarProducts.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          final item = state.similarProducts[index];
                          return SizedBox(
                            width: 200,
                            child: FootwearCard(
                              imageUrl: item.image,
                              name: item.title,
                              rating: item.rating.rating,
                              reviews: item.rating.reviews,
                              price: item.price,
                              onWishlistTap: () {},
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      "Ratings & Reviews",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),

                    ReviewFeildWidget(
                      rating: state.averageRating,
                      reviews: state.totalReviews,
                    ),
                  ],
                ),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
