import 'dart:developer';

import 'package:stool_in/exports/app_exports.dart';
import 'package:stool_in/features/profile/data/datasource/user_data_unique_datasource.dart';
import 'package:stool_in/features/profile/domain/error/user_data_unique_error.dart';
import 'package:stool_in/features/profile/domain/error/update_user_data_error.dart';
import 'package:stool_in/features/profile/domain/entity/user_data_unique_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/features/profile/domain/repository/user_data_unique_repository.dart';

class UserDataUniqueRepositoryImpl implements UserDataUniqueRepository {
  final UserDataUniqueDatasource _userDataUniqueDatasource;
  UserDataUniqueRepositoryImpl({
    required UserDataUniqueDatasource userDataUniqueDatasource,
  }) : _userDataUniqueDatasource = userDataUniqueDatasource;
  @override
  Future<Either<UserDataUniqueError, UserDataUniqueEntity>> getUserDataUnique(
      {required double latitude, required double longitude}) async {
    try {
      final result = await _userDataUniqueDatasource.getUserDataUnique(
        location: Location(
          latitude: latitude,
          longitude: longitude,
        ),
      );
      return Right(result);
    } on UserDataUniqueError catch (e, s) {
      log(
        'Erro ao fazer get unique dos usuários',
        error: e,
        stackTrace: s,
      );
      return Left(
        UserDataUniqueError(
          message: e.message,
        ),
      );
    } catch (e, s) {
      log(
        'Erro desconhecidos ao fazer get unique dos usuários',
        error: e,
        stackTrace: s,
      );
      return Left(
        UserDataUniqueError(
          message: 'Erro no servidor, tente mais tarde',
        ),
      );
    }
  }

  @override
  Future<Either<UpdateUserDataError, void>> updateUserData({
    required UserDataEntity userDataEntity,
  }) async {
    try {
      final result = await _userDataUniqueDatasource.updateUserData(
        userDataModel: UserDataModel.fromEntity(userDataEntity: userDataEntity),
      );
      return Right(result);
    } on UpdateUserDataError catch (e, s) {
      log(
        'Erro desconhecidos ao fazer update do usuário',
        error: e,
        stackTrace: s,
      );
      return Left(UpdateUserDataError(message: e.message));
    } catch (e, s) {
      log(
        'Erro desconhecidos ao fazer update do usuário',
        error: e,
        stackTrace: s,
      );
      return Left(
        UpdateUserDataError(
          message: 'Erro no servidor, tente mais tarde',
        ),
      );
    }
  }
}
