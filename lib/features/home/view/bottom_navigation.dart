import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/cart/view/cart_page.dart';
import 'package:footware_app/features/home/cubit/bottom_nav_cubit.dart';
import 'package:footware_app/features/home/view/home_page.dart';
import 'package:footware_app/features/home/widget/custom_bottom_nav.dart';
import 'package:footware_app/features/orders/view/orders_page.dart';
import 'package:footware_app/features/profile/view/profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<BottomNavCubit, int>(
          builder: (context, index) {
            // YOU already have pages — just map index
            switch (index) {
              case 0:
                return HomePage();
              case 1:
                return CartPage();
              case 2:
                return OrdersPage();
              case 3:
                return ProfilePage();
              default:
                return OrdersPage();
            }
          },
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}