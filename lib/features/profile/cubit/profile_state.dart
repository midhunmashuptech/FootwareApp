abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLogoutLoading extends ProfileState {}

class ProfileLogoutSuccess extends ProfileState {}

class ProfileLogoutFailure extends ProfileState {
  final String message;
  ProfileLogoutFailure(this.message);
}
