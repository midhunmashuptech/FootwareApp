import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/common/routes.dart';
import 'package:footware_app/features/profile_options/cubit/edit_profile_cubit.dart';
import 'package:footware_app/features/profile_options/view/edit_profile_screen.dart';
import 'package:footware_app/features/home/view/bottom_navigation.dart';
import 'package:footware_app/features/home/view/home_page.dart';

class AppRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.bottomNavigation:
        return MaterialPageRoute(builder: (_) => BottomNavigation());

      case Routes.editProfile:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
          create: (_) => EditProfileCubit(),
          child: const EditProfilePage(),
        ),
       );

      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomePage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Text("Route not found!")),
        );
    }
  }
}
