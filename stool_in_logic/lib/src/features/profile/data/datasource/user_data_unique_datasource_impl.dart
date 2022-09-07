import 'dart:developer';


import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/src/features/profile/data/datasource/user_data_unique_datasource.dart';

import '../../../auth/data/model/user_data_model.dart';
import '../../domain/entity/user_data_unique_entity.dart';
import '../../domain/entity/user_data_unique_location.dart';
import '../../domain/error/update_user_data_error.dart';
import '../../domain/error/user_data_unique_error.dart';
import '../model/user_data_unique_model.dart';

class UserDataUniqueDatasourceImpl implements UserDataUniqueDatasource {
  final RestClientGet _restClientGet;
  final RestClientPatch _restClientPatch;
  final CalculateDistanceForUserDataUnique _calculateDistanceForUserDataUnique;
  UserDataUniqueDatasourceImpl({
    required RestClientGet restClientGet,
    required RestClientPatch restClientPatch,
    required CalculateDistanceForUserDataUnique
        calculateDistanceForUserDataUnique,
  })  : _restClientGet = restClientGet,
        _calculateDistanceForUserDataUnique =
            calculateDistanceForUserDataUnique,
        _restClientPatch = restClientPatch;
  @override
  Future<UserDataUniqueEntity> getUserDataUnique({
    required UserDataUniqueLocation userDataUniqueLocation,
  }) async {
    try {
      final result = await _restClientGet.get(
        path: EndpointConstants.getUserDataUnique,
      );
      final distance = _calculateDistanceForUserDataUnique.calculateDistance(
        result: result,
        userLocation: userDataUniqueLocation,
      );
      final data = UserDataUniqueModel.fromMap(
        result.data,
        distance: distance,
      );
      return data;
    } on RestClientException catch (e, s) {
      log(
        'Erro ao fazer get dos dados do usuario no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw UserDataUniqueError(
        message: 'Erro ao buscar seus dados, tente mais tarde',
      );
    } on UserDataUniqueError catch (e, s) {
      log(
        'Erro ao fazer get dos dados do usuario no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw UserDataUniqueError(
        message: 'Erro ao buscar seus dados, tente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro desconhecido ao fazer get dos dados do usuario no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw UserDataUniqueError(
        message: 'Erro no servidor ao buscar seus dados, tente mais tarde',
      );
    }
  }

  @override
  Future<void> updateUserData({
    required UserDataModel userDataModel,
  }) async {
    try {
      await _restClientPatch.patch(
        path: EndpointConstants.updateUserData,
        data: userDataModel.toMap(),
      );
    } on RestClientException catch (e, s) {
      log(
        'Erro ao fazer patch do user data unique no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw UpdateUserDataError(
        message: 'Erro ao atualizar seus dados, tente mais tarde',
      );
    } on UpdateUserDataError catch (e, s) {
      log(
        'Erro ao fazer patch do user data unique no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw UpdateUserDataError(
        message: 'Erro ao atualizar seus dados, tente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro desconhecido ao fazer patch do user data unique no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw UpdateUserDataError(
        message: 'Erro no servidor ao atualizar seus dados, tente mais tarde',
      );
    }
  }
}
