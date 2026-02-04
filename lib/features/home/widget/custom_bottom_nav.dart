import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/common/app_colors.dart';
import 'package:footware_app/features/home/cubit/bottom_nav_cubit.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, currentIndex) {
        return Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFF2F2F2),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _navIcon(context, Icons.home_outlined, 0, currentIndex),
              _navIcon(context, Icons.shopping_cart_outlined, 1, currentIndex),
              _navIcon(context, Icons.shopping_bag_outlined, 2, currentIndex),
              _navIcon(context, Icons.person_outline, 3, currentIndex),
            ],
          ),
        );
      },
    );
  }

  Widget _navIcon(
    BuildContext context,
    IconData icon,
    int index,
    int currentIndex,
  ) {
    return GestureDetector(
      onTap: () => context.read<BottomNavCubit>().changeTab(index),
      child: Icon(
        icon,
        size: 26,
        color: currentIndex == index ? AppColors.primaryRed : AppColors.primaryBlack,
      ),
    );
  }
}
