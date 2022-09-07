import 'package:dartz/dartz.dart';

import '../../../auth/domain/entity/user_data_entity.dart';
import '../entity/user_data_unique_entity.dart';
import '../entity/user_data_unique_location.dart';
import '../error/update_user_data_error.dart';
import '../error/user_data_unique_error.dart';

abstract class UserDataUniqueRepository {
  Future<Either<UserDataUniqueError, UserDataUniqueEntity>> getUserDataUnique(
      {required UserDataUniqueLocation userDataUniqueLocation});
  Future<Either<UpdateUserDataError, void>> updateUserData({
    required UserDataEntity userDataEntity,
  });
}
