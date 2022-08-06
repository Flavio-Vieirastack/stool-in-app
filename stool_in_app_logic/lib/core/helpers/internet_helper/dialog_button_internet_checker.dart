import 'package:internet_connection_checker/internet_connection_checker.dart';

class DialogButtonInternetChecker {
  Future<void> checkConnection(Function popDialog) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      popDialog.call();
    }
  }
}
