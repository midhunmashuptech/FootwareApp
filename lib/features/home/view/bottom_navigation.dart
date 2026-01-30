import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/cart/view/cart_page.dart';
import 'package:footware_app/features/home/cubit/bottom_nav_cubit.dart';
import 'package:footware_app/features/home/view/home_page.dart';
import 'package:footware_app/features/orders/view/orders_page.dart';
import 'package:footware_app/features/profile/view/profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PersistentTabController(initialIndex: 0);

    return BlocListener<BottomNavCubit, int>(
      listener: (context, index) {
        controller.jumpToTab(index);
      },
      child: PersistentTabView(
        context,
        controller: controller,
        screens: const [
          HomePage(),
          CartPage(),
          OrdersPage(),
          ProfilePage(),
        ],
        items: [
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.home_outlined),
            activeColorPrimary: Colors.red,
            inactiveColorPrimary: Colors.black,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.shopping_cart_outlined),
            activeColorPrimary: Colors.red,
            inactiveColorPrimary: Colors.black,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.shopping_bag_outlined),
            activeColorPrimary: Colors.red,
            inactiveColorPrimary: Colors.black,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.person_outline),
            activeColorPrimary: Colors.red,
            inactiveColorPrimary: Colors.black,
          ),
        ],
        navBarStyle: NavBarStyle.style6, // closest to your image
        onItemSelected: (index) {
          context.read<BottomNavCubit>().changeTab(index);
        },
      ),
    );
  }
}