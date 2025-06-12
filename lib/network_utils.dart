import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkUtils {
  static Future<bool> hasInternetConnection() async {
    final result = await Connectivity().checkConnectivity();
    return result == ConnectivityResult.mobile || result == ConnectivityResult.wifi;
  }
}
