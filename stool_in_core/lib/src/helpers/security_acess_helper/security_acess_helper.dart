import 'package:flutter_security_checker/flutter_security_checker.dart';

class SecurityAcessHelper {
  Future<bool> blockDevice() async {
    final isRooted = await FlutterSecurityChecker.isRooted;

    final isRealDevice = await FlutterSecurityChecker.isRealDevice;

    final hasCorrectlyInstalled =
        await FlutterSecurityChecker.hasCorrectlyInstalled;

    if (isRooted || !isRealDevice || !hasCorrectlyInstalled) {
      return true;
    } else {
      return false;
    }
  }
}
