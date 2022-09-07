
import '../../../domain/entity/user_token_entity.dart';
import '../../model/auth_model.dart';

abstract class LoginDatasource {
  Future<UserTokenEntity> apiLogin({
    required AuthModel authModel,
  });
  Future<void> firebaseLogin({
    required AuthModel authModel,
  });
}
