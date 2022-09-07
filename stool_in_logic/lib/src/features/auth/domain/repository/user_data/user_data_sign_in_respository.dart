
import 'package:dartz/dartz.dart';

import '../../entity/user_data_entity.dart';
import '../../error/user_data_error.dart';

abstract class UserDataSignInRepository {
  Future<Either<UserDataError, UserDataEntity>> sendUserData({
    required UserDataEntity userDataEntity,
  });
}
