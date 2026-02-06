import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/products_details/cubit/review_cubit.dart';
import 'package:footware_app/features/products_details/cubit/review_state.dart';
import 'package:footware_app/features/products_details/widgets/star_ratingsdart';

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
    return BlocProvider(
      create: (_) => ReviewCubit(),
      child: BlocBuilder<ReviewCubit, ReviewState>(
        builder: (context, state) {
          final formState = state as ReviewFormState;
          final cubit = context.read<ReviewCubit>();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "$reviews Reviews",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
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

              //Stars
              Row(
                children: List.generate(5, (index) {
                  final starValue = index + 1;
                  return GestureDetector(
                    onTap: formState.submitted
                        ? null
                        : () => cubit.updateRating(starValue),
                    child: Icon(
                      starValue <= formState.rating
                          ? Icons.star
                          : Icons.star_border,
                      size: 28,
                      color: Colors.amber,
                    ),
                  );
                }),
              ),

              const SizedBox(height: 16),

              //Review
              TextField(
                maxLines: 4,
                enabled: !formState.submitted,
                onChanged: cubit.updateReview,
                decoration: InputDecoration(
                  hintText: "What other customers should know?",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),

              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: formState.submitted
                        ? Colors.green
                        : Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: formState.submitted
                      ? null
                      : () {
                          if (formState.rating == 0 ||
                              formState.review.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Please add rating and review"),
                              ),
                            );
                            return;
                          }
                          cubit.submitReview();
                        },
                  child: Text(
                    formState.submitted
                        ? "Review submitted successfully"
                        : "Submit",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
