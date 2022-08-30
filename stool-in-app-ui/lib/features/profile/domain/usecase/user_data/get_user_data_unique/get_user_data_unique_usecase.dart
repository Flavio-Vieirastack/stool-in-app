import 'package:dartz/dartz.dart';
import 'package:stool_in/features/profile/domain/entity/user_data_unique_entity.dart';
import 'package:stool_in/features/profile/domain/error/user_data_unique_error.dart';

abstract class GetUserDataUniqueUsecase {
  Future<Either<UserDataUniqueError, UserDataUniqueEntity>> call();
}
