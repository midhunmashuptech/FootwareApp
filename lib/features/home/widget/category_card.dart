import 'package:flutter/material.dart';
import 'package:footware_app/features/common/app_colors.dart';

class CategoryCard extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final Function(String) onTap;

  const CategoryCard({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedCategory == category;

          return GestureDetector(
            onTap: () => onTap(category),
            child: Container(
              width: 120,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryBlack : AppColors.grey,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.primaryBlack)
              ),
              child: Center(
                child: Text(
                  category,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: isSelected ? AppColors.primaryWhite : AppColors.primaryBlack,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
