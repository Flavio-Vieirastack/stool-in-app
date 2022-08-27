
import 'package:dartz/dartz.dart';
import '../../../../../exports/app_exports.dart';

abstract class UserDataSignInRepository {
  Future<Either<UserDataError, UserDataEntity>> sendUserData({
    required UserDataEntity userDataEntity,
  });
}
