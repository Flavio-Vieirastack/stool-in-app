import 'package:dartz/dartz.dart';
import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in/features/profile/domain/entity/user_data_unique_entity.dart';
import 'package:stool_in/features/profile/domain/error/update_user_data_error.dart';
import 'package:stool_in/features/profile/domain/error/user_data_unique_error.dart';

abstract class UserDataUniqueUsecase {
  Future<Either<UserDataUniqueError, UserDataUniqueEntity>> getUserDataUnique({required double latitude, required double longitude});
  Future<Either<UpdateUserDataError, void>> updateUserData({
    required UserDataEntity userDataEntity,
  });
}