import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/main.dart';

class FirebaseNotifications{
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications()async{
    await _firebaseMessaging.requestPermission();
    String? token = await _firebaseMessaging.getToken();
    print("Token: $token");
    handleBackgroundNotification();
  }
  void handleMessage(RemoteMessage? message){
    if(message == null) return;
    navigatorKey.currentState!.pushNamed(AppRoutesName.notificationsScreen, arguments: message);
  }

  Future handleBackgroundNotification() async{
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}