import 'dart:developer';

import 'package:flutter/foundation.dart';

class TryCatchHelper {
  static Future<bool> makeRequest({
    required AsyncCallback function,
    Function? onError,
  }) async {
    try {
      await function.call();
      return true;
    } catch (e, s) {
      log('Erro no try catch helper $function', error: e, stackTrace: s);
      onError?.call();
      return false;
    }
  }
}
