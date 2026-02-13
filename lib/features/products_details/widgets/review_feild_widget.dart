import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/common/app_colors.dart';
import 'package:footware_app/features/products_details/bloc/product_details_bloc.dart';
import 'package:footware_app/features/products_details/bloc/product_details_event.dart';
import 'package:footware_app/features/products_details/bloc/product_details_state.dart';
import 'package:footware_app/features/products_details/widgets/star_ratings.dart';

class ReviewFeildWidget extends StatelessWidget {
  final double rating;
  final int reviews;

  const ReviewFeildWidget({
    super.key,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        if (state is! ProductDetailsLoaded) {
          return const SizedBox.shrink();
        }

        final bloc = context.read<ProductDetailsBloc>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Review summary
            Row(
              children: [
                Text(
                  "$reviews Reviews",
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(width: 10),
                StarRating(rating: rating, size: 20),
                const SizedBox(width: 6),
                Text(
                  "$rating / 5",
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),

            const SizedBox(height: 16),

            const Text(
              "Write your review on this product",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 12),

            /// 🔹 Rating stars
            Row(
              children: List.generate(5, (index) {
                final starValue = index + 1;
                return GestureDetector(
                  onTap: state.reviewSubmitted
                      ? null
                      : () => bloc.add(UpdateRating(starValue)),
                  child: Icon(
                    starValue <= state.userRating
                        ? Icons.star
                        : Icons.star_border,
                    size: 28,
                    color: AppColors.ratingOrange,
                  ),
                );
              }),
            ),

            const SizedBox(height: 16),

            /// 🔹 Review text
            TextField(
              maxLines: 4,
              enabled: !state.reviewSubmitted,
              onChanged: (text) =>
                  bloc.add(UpdateReview(text)),
              decoration: InputDecoration(
                hintText: "What other customers should know?",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),

            const SizedBox(height: 20),

            //Submit button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: state.reviewSubmitted
                      ? AppColors.darkGreen
                      : AppColors.primaryBlack,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: state.reviewSubmitted
                    ? null
                    : () {
                        if (state.userRating == 0 ||
                            state.userReview.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "Please add rating and review"),
                            ),
                          );
                          return;
                        }
                        bloc.add(SubmitReview());
                      },
                child: Text(
                  state.reviewSubmitted
                      ? "Review submitted successfully"
                      : "Submit",
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryWhite,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
