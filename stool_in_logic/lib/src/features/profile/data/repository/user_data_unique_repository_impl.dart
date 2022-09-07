import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:stool_in_logic/src/features/auth/domain/entity/user_data_entity.dart';


import '../../../auth/data/model/user_data_model.dart';
import '../../domain/entity/user_data_unique_entity.dart';
import '../../domain/entity/user_data_unique_location.dart';
import '../../domain/error/update_user_data_error.dart';
import '../../domain/error/user_data_unique_error.dart';
import '../../domain/repository/user_data_unique_repository.dart';
import '../datasource/user_data_unique_datasource.dart';

class UserDataUniqueRepositoryImpl implements UserDataUniqueRepository {
  final UserDataUniqueDatasource _userDataUniqueDatasource;
  UserDataUniqueRepositoryImpl({
    required UserDataUniqueDatasource userDataUniqueDatasource,
  }) : _userDataUniqueDatasource = userDataUniqueDatasource;
  @override
  Future<Either<UserDataUniqueError, UserDataUniqueEntity>> getUserDataUnique(
      {required UserDataUniqueLocation userDataUniqueLocation}) async {
    try {
      final result = await _userDataUniqueDatasource.getUserDataUnique(
        userDataUniqueLocation: userDataUniqueLocation,
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
