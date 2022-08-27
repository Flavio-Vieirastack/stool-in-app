
import 'package:dartz/dartz.dart';
import '../../../export/auth_exports.dart';

abstract class UserDataSignInRepository {
  Future<Either<UserDataError, UserDataEntity>> sendUserData({
    required UserDataEntity userDataEntity,
  });
}
