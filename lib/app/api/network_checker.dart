import 'package:internet_connection_checker/internet_connection_checker.dart';

/// This class is used to check the network connection.
class NetworkChecker {
  /// This method is used to check the network connection.
  static Future<bool> hasConnection() async {
    bool result = await InternetConnectionChecker.I.hasConnection;
    return result;
  }
}
