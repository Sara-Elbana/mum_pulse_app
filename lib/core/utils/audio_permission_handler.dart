import 'package:permission_handler/permission_handler.dart';

class PermissionsHelper {
  static Future<bool> requestMicPermission() async {
    var status = await Permission.microphone.request();
    return status.isGranted;
  }
}
