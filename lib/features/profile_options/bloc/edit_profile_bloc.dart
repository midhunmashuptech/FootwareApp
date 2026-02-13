import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'edit_profile_event.dart';
import 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final ImagePicker _picker = ImagePicker();

  EditProfileBloc() : super(const EditProfileState()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateName>((e, emit) => emit(state.copyWith(name: e.name)));
    on<UpdatePhone>((e, emit) => emit(state.copyWith(phone: e.phone)));
    on<UpdateEmail>((e, emit) => emit(state.copyWith(email: e.email)));
    on<UpdateLocation>((e, emit) => emit(state.copyWith(location: e.location)));
    on<UpdateDob>((e, emit) => emit(state.copyWith(dob: e.dob)));
    on<UpdateGender>((e, emit) => emit(state.copyWith(gender: e.gender)));
    on<UpdateSize>((e, emit) => emit(state.copyWith(size: e.size)));
    on<UpdateBrand>((e, emit) => emit(state.copyWith(brand: e.brand)));
    on<PickImageFromCamera>(_pickFromCamera);
    on<PickImageFromGallery>(_pickFromGallery);
    on<SaveProfile>(_onSaveProfile);
  }

  Future<void> _onLoadProfile(
    LoadProfile event, Emitter<EditProfileState> emit) async {

  emit(state.copyWith(isLoading: true));

  await Future.delayed(const Duration(seconds: 1));

  emit(state.copyWith(
    name: "Seteve Harrington",
    phone: "5678902345",
    email: "steve@harringtonemail.com",
    location: "Indiana",
    dob: "10/05/1984",
    gender: "Male",
    size: "8",
    brand: "Nike",
    isLoading: false,
  ));
}


  Future<void> _pickFromCamera(
      PickImageFromCamera event, Emitter<EditProfileState> emit) async {
    final XFile? file =
        await _picker.pickImage(source: ImageSource.camera);

    if (file != null) {
      emit(state.copyWith(profileImage: File(file.path)));
    }
  }

  Future<void> _pickFromGallery(
      PickImageFromGallery event, Emitter<EditProfileState> emit) async {
    final XFile? file =
        await _picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      emit(state.copyWith(profileImage: File(file.path)));
    }
  }

  Future<void> _onSaveProfile(
      SaveProfile event, Emitter<EditProfileState> emit) async {
    emit(state.copyWith(isSaving: true));

    await Future.delayed(const Duration(seconds: 2)); // simulate save

    emit(state.copyWith(isSaving: false));
  }
}
