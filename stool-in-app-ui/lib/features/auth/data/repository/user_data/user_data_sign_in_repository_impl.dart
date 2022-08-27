import 'dart:developer';


import 'package:dartz/dartz.dart';
import '../../../export/auth_exports.dart';

class UserDataSignInRepositoryImpl implements UserDataSignInRepository {
  final UserDataSignInDatasource _userDataSignInDatasource;
  UserDataSignInRepositoryImpl({
    required UserDataSignInDatasource userDataSignInDatasource,
  }) : _userDataSignInDatasource = userDataSignInDatasource;
  @override
  Future<Either<UserDataError, UserDataEntity>> sendUserData({
    required UserDataEntity userDataEntity,
  }) async {
    try {
      final result = await _userDataSignInDatasource.sendUserData(
        userDataModel: UserDataModel.fromEntity(userDataEntity: userDataEntity),
      );
      return Right(result);
    } on UserDataError catch (e, s) {
      log(
        'Erro ao enviar dados do usuário para a api',
        error: e,
        stackTrace: s,
      );
      return Left(
        UserDataError(message: e.message),
      );
    }
  }
}
