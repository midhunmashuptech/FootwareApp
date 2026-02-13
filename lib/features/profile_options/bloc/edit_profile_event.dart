
abstract class EditProfileEvent{
  @override
  List<Object?> get props => [];
}

/// Load profile
class LoadProfile extends EditProfileEvent {}

/// Field updates
class UpdateName extends EditProfileEvent {
  final String name;
  UpdateName(this.name);

  @override
  List<Object?> get props => [name];
}

class UpdatePhone extends EditProfileEvent {
  final String phone;
  UpdatePhone(this.phone);

  @override
  List<Object?> get props => [phone];
}

class UpdateEmail extends EditProfileEvent {
  final String email;
  UpdateEmail(this.email);

  @override
  List<Object?> get props => [email];
}

class UpdateLocation extends EditProfileEvent {
  final String location;
  UpdateLocation(this.location);

  @override
  List<Object?> get props => [location];
}

class UpdateDob extends EditProfileEvent {
  final String dob;
  UpdateDob(this.dob);

  @override
  List<Object?> get props => [dob];
}

class UpdateGender extends EditProfileEvent {
  final String gender;
  UpdateGender(this.gender);

  @override
  List<Object?> get props => [gender];
}

class UpdateSize extends EditProfileEvent {
  final String size;
  UpdateSize(this.size);

  @override
  List<Object?> get props => [size];
}

class UpdateBrand extends EditProfileEvent {
  final String brand;
  UpdateBrand(this.brand);

  @override
  List<Object?> get props => [brand];
}

/// Image picking
class PickImageFromCamera extends EditProfileEvent {}

class PickImageFromGallery extends EditProfileEvent {}

/// Save
class SaveProfile extends EditProfileEvent {}
