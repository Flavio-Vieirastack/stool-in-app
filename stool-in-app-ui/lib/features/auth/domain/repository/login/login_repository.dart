import 'package:dartz/dartz.dart';
import 'package:stool_in_app_ui/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in_app_ui/features/auth/domain/entity/user_token_entity.dart';


import '../../error/api_auth_error.dart';
import '../../error/firebase_auth_error.dart';

abstract class LoginRepository {
  Future<Either<FirebaseAuthError, void>> firebaseLogin({
    required AuthEntity authEntity,
  });
  Future<Either<ApiAuthError, UserTokenEntity>> apiLogin({
    required AuthEntity authEntity,
  });
}
