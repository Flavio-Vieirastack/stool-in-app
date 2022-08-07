
import 'package:dartz/dartz.dart';
import 'package:stool_in_app_ui/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in_app_ui/features/auth/domain/error/user_data_error.dart';

abstract class UserDataSignInRepository {
  Future<Either<UserDataError, UserDataEntity>> sendUserData({
    required UserDataEntity userDataEntity,
  });
}
