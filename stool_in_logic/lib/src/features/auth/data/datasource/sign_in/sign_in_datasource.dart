

import '../../../../../exports/app_exports.dart';

abstract class SignInDatasource {
  Future<void> firebaseSignIn({
    required AuthModel authModel,
  });
  Future<void> apiSignIn({
    required AuthModel authModel,
  });
}
