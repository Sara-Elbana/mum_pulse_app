import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_pulse_app/modules/authentication/features/services/firebase_auth_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuthService _authService;
  AuthCubit(this._authService) : super(AuthInitial());

  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(AuthLoading());
    try {
      final user = await _authService.registerWithEmail(
          email: email, password: password, name: name);
      if (user != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthError("Registration failed"));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final user = await _authService.loginWithEmail(
          email: email, password: password);
      if (user != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthError("Login failed"));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
