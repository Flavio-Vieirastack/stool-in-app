import 'dart:developer';

class TryCatchHelper {
  static Future<bool> makeRequest({required Function function}) async {
    try {
      await function.call();
      return true;
    } catch (e, s) {
      log('Erro no try catch helper', error: e, stackTrace: s);
      return false;
    }
  }
}
