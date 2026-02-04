import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/profile_options/cubit/edit_profile_state.dart';


class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileState());

  void changeGender(String? gender) {
    emit(state.copyWith(gender: gender));
  }

  void changeSize(String? size) {
    emit(state.copyWith(size: size));
  }

  Future<void> loadProfile() async {
  emit(state.copyWith(isLoading: true));

  await Future.delayed(const Duration(seconds: 1));

  emit(state.copyWith(
    isLoading: false,
    name: "Steve Harrington",
    phone: "+91 5907654321",
    email: "steveharrington@email.com",
    location: "Hawkins",
    dob: "12/08/1984",
    gender: "",
    size: "",
    brand: "",
  ));
}

}
