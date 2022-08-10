

import 'package:stool_in/features/auth/data/model/auth_model.dart';

abstract class SignInDatasource {
  Future<void> firebaseSignIn({
    required AuthModel authModel,
  });
  Future<void> apiSignIn({
    required AuthModel authModel,
  });
}
