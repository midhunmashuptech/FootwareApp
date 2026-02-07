import 'package:flutter/material.dart';
import 'package:footware_app/features/common/app_colors.dart';

class ProductFeatureCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;

  const ProductFeatureCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondaryGrey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Icon
            Icon(icon, color: iconColor, size: 26),

            const SizedBox(width: 12),

            // Divider
            VerticalDivider(width: 20, thickness: 1, color: AppColors.darkGrey),

            const SizedBox(width: 12),

            // Text
            Text(
              text,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
