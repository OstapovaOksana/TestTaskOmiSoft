import 'package:connectivity/connectivity.dart';

class NetworkManager {
  Future<bool> hasConnection() async {
    var connectionResult = await (Connectivity().checkConnectivity());
    return connectionResult != ConnectivityResult.none;
  }
}