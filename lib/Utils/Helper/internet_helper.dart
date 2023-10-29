
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectivityStatus {
  WiFi,
  Cellular,
  Offline
}

//Internet Connectivity
class NetworkConnection {
  static final NetworkConnection _instance = NetworkConnection._internal();
  final Connectivity _connectivity = Connectivity();
  static NetworkConnection get instance => _instance;
bool isInternetWroking =false;
  NetworkConnection._internal();

  
  Future<bool> checkInternet() async {
    bool checkConnection;
    try {
      var connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
       checkConnection = false;
       isInternetWroking=  false;
       // No internet connection
    } else {
      checkConnection = true;
      isInternetWroking = true;
      // Internet connection is available
    }
    } on SocketException catch (_) {
      checkConnection = false;
      isInternetWroking=false;
    }
    return checkConnection;
  }
}

