import 'dart:developer';


import 'package:dartz/dartz.dart';
import 'package:stool_in/features/auth/data/datasource/user_data/user_data_sign_in_datasource.dart';
import 'package:stool_in/features/auth/data/model/user_data_model.dart';
import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in/features/auth/domain/error/user_data_error.dart';
import 'package:stool_in/features/auth/domain/repository/user_data/user_data_sign_in_respository.dart';

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
