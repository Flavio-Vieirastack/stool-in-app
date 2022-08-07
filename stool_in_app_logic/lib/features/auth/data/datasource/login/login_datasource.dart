import 'package:stool_in_app_logic/features/auth/data/model/auth_model.dart';

import '../../../domain/entity/user_token_entity.dart';

abstract class LoginDatasource {
  Future<UserTokenEntity> apiLogin({
    required AuthModel authModel,
  });
  Future<void> firebaseLogin({
    required AuthModel authModel,
  });
}
