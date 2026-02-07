import 'package:flutter/material.dart';
import 'package:footware_app/features/common/app_colors.dart';

class UserReviewCard extends StatelessWidget {
  final String userName;
  final String userImage;
  final double rating;
  final String reviewTime;
  final String reviewTitle;
  final String reviewText;

  const UserReviewCard({
    super.key,
    required this.userName,
    required this.userImage,
    required this.rating,
    required this.reviewTime,
    required this.reviewTitle,
    required this.reviewText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(userImage)
              ),
              const SizedBox(width: 10),
              // Name, rating, verified
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name + Time
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          reviewTime,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    // Rating 
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.ratingOrange,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Review Title
          Text(
            reviewTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          // Review Text
          Text(
            reviewText,
            style: TextStyle(
              fontSize: 13,
              color: AppColors.primaryBlack,
            ),
          ),
        ],
      ),
    );
  }
}
