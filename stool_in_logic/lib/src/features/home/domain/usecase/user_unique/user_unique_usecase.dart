import 'package:dartz/dartz.dart';

import '../../entity/user_unique/user_unique_entity.dart';
import '../../error/user_unique/user_unique_error.dart';

abstract class UserUniqueUsecase {
  Future<Either<UserUniqueError, UserUniqueEntity>> call();
}