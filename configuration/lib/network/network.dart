import 'package:configuration/utility/logging.dart';
import 'package:connectivity/connectivity.dart';

startNetworkChecking() async {
  Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    Log.info('Network', 'Network checking: ConnectivityResult $result');
    if (result == ConnectivityResult.none) {
      //TODO Something
    }
  });
}
