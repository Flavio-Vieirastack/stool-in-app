

import '../../../export/auth_exports.dart';

abstract class LoginDatasource {
  Future<UserTokenEntity> apiLogin({
    required AuthModel authModel,
  });
  Future<void> firebaseLogin({
    required AuthModel authModel,
  });
}
