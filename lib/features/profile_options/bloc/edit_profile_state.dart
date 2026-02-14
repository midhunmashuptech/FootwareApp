import 'dart:io';

class EditProfileState {
  final String? name;
  final String? phone;
  final String? email;
  final String? location;
  final String? dob;
  final String? gender;
  final String? size;
  final String? brand;
  final File? profileImage;
  final bool isLoading;
  final bool isSaving;final String? successMessage;


  const EditProfileState({
    this.name,
    this.phone,
    this.email,
    this.location,
    this.dob,
    this.gender,
    this.size,
    this.brand,
    this.profileImage,
    this.isLoading = false,
    this.isSaving = false, 
    this.successMessage,

  });

  EditProfileState copyWith({
    String? name,
    String? phone,
    String? email,
    String? location,
    String? dob,
    String? gender,
    String? size,
    String? brand,
    File? profileImage,
    bool? isLoading,
    bool? isSaving,
     String? successMessage,

  }) {
    return EditProfileState(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      location: location ?? this.location,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      size: size ?? this.size,
      brand: brand ?? this.brand,
      profileImage: profileImage ?? this.profileImage,
      isLoading: isLoading ?? this.isLoading,
      isSaving: isSaving ?? this.isSaving,
       successMessage: successMessage,
    );
  }

  @override
  List<Object?> get props =>
      [name, phone, email, location, dob, gender, size, brand, profileImage, isLoading, isSaving];
}
