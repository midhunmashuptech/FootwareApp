import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModeCubit extends Cubit<bool> {
  static const _key = "isDarkMode";

  DarkModeCubit() : super(false) {
    loadTheme(); // load saved theme on start
  }

  void toggleDarkMode(bool value) async {
    emit(value);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, value);
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getBool(_key) ?? false;
    emit(savedTheme);
  }
}
