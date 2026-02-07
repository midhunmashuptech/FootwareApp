import 'package:flutter/material.dart';
import 'package:footware_app/features/common/app_colors.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double size;

  const StarRating({
    super.key,
    required this.rating,
    this.size = 22,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating.floor() ? Icons.star : Icons.star_border,
          color: AppColors.ratingOrange,
          size: size,
        );
      }),
    );
  }
}
