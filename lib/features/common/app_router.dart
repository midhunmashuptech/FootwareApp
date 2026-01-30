import 'package:flutter/material.dart';
import 'package:footware_app/features/common/routes.dart';
import 'package:footware_app/features/home/view/bottom_navigation.dart';

class AppRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.bottomNavigation:
        return MaterialPageRoute(builder: (_) => BottomNavigation());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Text("Route not found!")),
        );
    }
  }
}
