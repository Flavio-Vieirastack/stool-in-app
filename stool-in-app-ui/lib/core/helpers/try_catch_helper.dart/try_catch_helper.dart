import 'dart:developer';

import 'package:flutter/foundation.dart';

class TryCatchHelper {
  static Future<bool> makeRequest({required AsyncCallback function}) async {
    try {
      await function.call();
      return true;
    } catch (e, s) {
      log('Erro no try catch helper', error: e, stackTrace: s);
      return false;
    }
  }
}
