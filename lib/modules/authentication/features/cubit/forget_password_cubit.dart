import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  Future<void> sendResetEmail(String email) async {
    emit(ForgetPasswordLoading());

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(ForgetPasswordSuccess());
    } on FirebaseAuthException catch (e) {
      emit(ForgetPasswordError(e.message ?? 'Something went wrong'));
    }
  }
}
