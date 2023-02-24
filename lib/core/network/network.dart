import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfoImpl extends NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;
  NetworkInfoImpl(this.internetConnectionChecker);

  @override
  Future<bool> isConnected() async => await internetConnectionChecker.hasConnection;

}