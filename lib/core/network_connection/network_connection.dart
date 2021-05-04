import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkConnection {
  Future<bool> get isConnected;
}

class NetworkConnectionImpl extends NetworkConnection {
  final DataConnectionChecker dataConnectionChecker;
  NetworkConnectionImpl({this.dataConnectionChecker});

  @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}
