import 'dart:async';

import 'package:data_connection_checker/data_connection_checker.dart';

class ConnectionChecker {
  StreamController<DataConnectionStatus> _connectivityStream;

  ConnectionChecker() {
    _connectivityStream = StreamController();

    DataConnectionChecker()
        .onStatusChange
        .listen((DataConnectionStatus connectionStatus) {
      _connectivityStream.sink.add(connectionStatus);
    });
  }

  Stream<DataConnectionStatus> get getConnectivityResult {
    return _connectivityStream.stream;
  }

  void closeStream(){
    _connectivityStream.close();
  }
}
