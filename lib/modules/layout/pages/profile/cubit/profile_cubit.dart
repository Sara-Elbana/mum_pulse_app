import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final _auth = FirebaseAuth.instance;

  void loadUserProfile() {
    emit(ProfileLoading());
    try {
      final user = _auth.currentUser;
      if (user != null) {
        emit(ProfileLoaded(
          name: user.displayName,
          photoUrl: user.photoURL,
        ));
      } else {
        emit(ProfileError("User not found"));
      }
    } catch (e) {
      emit(ProfileError("Failed to load profile: ${e.toString()}"));
    }
  }


  Future<void> updateName(String newName) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await user.updateDisplayName(newName);
        await user.reload();
        emit(ProfileUpdated());
      }
    } catch (e) {
      emit(ProfileError("Failed to update name ${e.toString()}"));
    }
  }

  Future<void> updateEmail(String newEmail, String password) async {
    try {
      final user = _auth.currentUser;
      if (user != null && user.email != null) {
        final credential = EmailAuthProvider.credential(
          email: user.email!,
          password: password,
        );

        await user.reauthenticateWithCredential(credential);
        await user.updateEmail(newEmail);
        await user.reload();
        emit(ProfileUpdated());
      }
    } catch (e) {
      emit(ProfileError("Failed to update email:${e.toString()}"));
    }
  }
}






