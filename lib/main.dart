import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_pulse_app/core/helper/notification_helper.dart';
import 'package:mom_pulse_app/core/routes/app_routes.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/service/notification_service.dart';
import 'package:mom_pulse_app/firebase_manager/firebase_notifications.dart';
import 'package:mom_pulse_app/modules/layout/pages/chat_bot/data/repository/chat_repository.dart';
import 'package:mom_pulse_app/modules/layout/pages/chat_bot/logic/chat_cubit.dart';
import 'package:mom_pulse_app/modules/layout/pages/profile/cubit/profile_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseNotifications().initNotifications();
  await NotificationHelper.init();
  await NotificationService.init();
  runApp(const MyApp());
}
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileCubit>(
            create: (context) => ProfileCubit()..loadUserProfile(),
        ),
        BlocProvider<ChatCubit>(
          create: (context) => ChatCubit(ChatRepository(Dio())),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        routes: AppRoutes.routes,
        initialRoute: AppRoutesName.firstSplashScreen,
      ),
    );
  }
}


