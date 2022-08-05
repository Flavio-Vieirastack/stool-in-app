import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class DialogButtonInternetChecker {
  Future<void> checkConnection(VoidCallback popDialog) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      popDialog.call();
    }
  }
}
