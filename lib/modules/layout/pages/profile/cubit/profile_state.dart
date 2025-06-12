abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileUpdated extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String? name;
  final String? photoUrl;

  ProfileLoaded({this.name, this.photoUrl});
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}
