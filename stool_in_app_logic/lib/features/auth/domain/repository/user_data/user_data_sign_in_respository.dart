import 'package:stool_in_app_logic/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in_app_logic/features/auth/domain/error/user_data_error.dart';
import 'package:stool_in_app_logic/stool_in_app_logic.dart';

abstract class UserDataSignInRepository {
  Future<Either<UserDataError, UserDataEntity>> sendUserData({
    required UserDataEntity userDataEntity,
  });
}
