import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> checkUserStatus() async {
    await Future.delayed(const Duration(seconds: 4));

    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('isFirstTime') ?? true;
    final user = FirebaseAuth.instance.currentUser;

    if (isFirstTime) {
      await prefs.setBool('isFirstTime', false);
      emit(SplashNavigateToIntro());
    } else if (user != null) {
      emit(SplashNavigateToHome());
    } else {
      emit(SplashNavigateToLogin());
    }
  }
}
