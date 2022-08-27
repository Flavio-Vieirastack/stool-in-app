

import '../../../export/auth_exports.dart';

abstract class PasswordResetDatasource {
  Future<void> firebasePasswordReset({required AuthModel authModel});
  Future<void> apiPasswordReset({required AuthModel authModel});
}
