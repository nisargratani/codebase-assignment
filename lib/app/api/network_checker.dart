import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkChecker {
  static Future<bool> hasConnection() async {
    bool result = await InternetConnectionChecker.I.hasConnection;
    return result;
  }
}
