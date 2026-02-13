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
      child: Row(
        children: [
          //Icon
          Icon(icon, color: iconColor, size: 26),
      
          const SizedBox(width: 10),
      
          // Divider
          VerticalDivider(width: 10, thickness: 1, color: AppColors.darkGrey),
      
          const SizedBox(width: 10),
      
          // Text
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
