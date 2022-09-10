import 'package:dartz/dartz.dart';
import 'package:stool_in_logic/src/features/home/domain/entity/user_unique/user_unique_entity.dart';
import 'package:stool_in_logic/src/features/home/domain/error/user_unique/user_unique_error.dart';

abstract class UserUniqueRepository {
  Future<Either<UserUniqueError, UserUniqueEntity>> call();
}
