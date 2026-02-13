import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/cart/bloc/cart_bloc.dart';
import 'package:footware_app/features/common/app_router.dart';
import 'package:footware_app/features/common/routes.dart';
import 'package:footware_app/features/home/bloc/home_bloc.dart';
import 'package:footware_app/features/home/bloc/wishlist_bloc.dart';
import 'package:footware_app/features/home/cubit/bottom_nav_cubit.dart';
import 'package:footware_app/features/profile/cubit/dark_mode_cubit.dart';
import 'package:footware_app/features/profile/cubit/profile_cubit.dart';
import 'package:footware_app/features/profile_options/cubit/add_adrress_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(create: (_) => DarkModeCubit()),
        BlocProvider(create: (_) => HomeBloc()),
        BlocProvider(create: (_) => WishlistBloc()),
        BlocProvider(create: (_) => AddressFormCubit()),
        BlocProvider(create: (_) => CartBloc()),
        BlocProvider(create: (_) => ProfileCubit()),
      ],
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
      },
    );
  }
}

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.black,
    onPrimary: Colors.white,
    secondary: Colors.grey,
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
  ),
  scaffoldBackgroundColor: Colors.white,
  
  // 👇 Add these to override the purple
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey, width: 1),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.black,
    selectionColor: Colors.grey,
    selectionHandleColor: Colors.black,
  ),
  
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
  ),

  cardColor: const Color(0xFFF7F7F7),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.white,
    onPrimary: Colors.black,
    secondary: Colors.grey,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: Color(0xFF363636),
    onSurface: Colors.white,
  ),
  scaffoldBackgroundColor: const Color(0xFF363636),
  
  // 👇 Dark theme overrides
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey, width: 1),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF363636),
    foregroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.white,
    selectionColor: Colors.grey,
    selectionHandleColor: Colors.white,
  ),
  
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
  ),
  cardColor: Color.fromARGB(255, 77, 77, 77),
);