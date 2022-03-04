import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';

class NetworkService {
  static final FlutterNetworkConnectivity _flutterNetworkConnectivity =
      FlutterNetworkConnectivity(
    lookUpUrl: 'google.com',
  );

  static Future<bool> checkInternetConnection() async {
    try {
      bool isInternetAvailable = false;

      isInternetAvailable =
          await _flutterNetworkConnectivity.isInternetConnectionAvailable();
      return isInternetAvailable;
    } catch (e) {
      print('Error checking internet connection: $e');
      return true;
    }
  }
}
