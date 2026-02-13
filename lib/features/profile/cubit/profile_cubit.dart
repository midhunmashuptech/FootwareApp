import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> logout() async {
    emit(ProfileLogoutLoading());

    try {
      final prefs = await SharedPreferences.getInstance();

      /// Clear all stored user data
      await prefs.clear();

      emit(ProfileLogoutSuccess());
    } catch (e) {
      emit(ProfileLogoutFailure("Logout failed. Please try again."));
    }
  }
}
