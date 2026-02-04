import 'package:flutter/material.dart';
import 'package:footware_app/features/common/routes.dart';
import 'package:footware_app/features/home/view/bottom_navigation.dart';
import 'package:footware_app/features/home/view/wishlist_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.bottomNavigation:
        return MaterialPageRoute(builder: (_) => BottomNavigation());

      case Routes.wishlist:
        return MaterialPageRoute(builder: (_) => WishlistScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Text("Route not found!")),
        );
    }
  }
}
