import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/common/app_colors.dart';
import 'package:footware_app/features/common/app_router.dart';
import 'package:footware_app/features/common/routes.dart';
import 'package:footware_app/features/home/cubit/bottom_nav_cubit.dart';
import 'package:footware_app/features/profile/cubit/dark_mode_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => BottomNavCubit()),
                  BlocProvider(create: (_) => DarkModeCubit())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return BlocBuilder<DarkModeCubit, bool>(
      builder: (context, isDarkMode) {
    return MaterialApp(
      title: 'Footware App',
      initialRoute: Routes.bottomNavigation,
      onGenerateRoute: AppRouter.generateRoutes,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
    );
   }
  );
 }
}

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: AppColors.primaryRed,
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.black87,
    textColor: Colors.black87,
  ),
  dividerColor: Colors.black12,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color.fromARGB(255, 54, 54, 54),
  primaryColor: AppColors.primaryRed,
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.white,
    textColor: Colors.white,
  ),
  dividerColor: Colors.white24,
);
