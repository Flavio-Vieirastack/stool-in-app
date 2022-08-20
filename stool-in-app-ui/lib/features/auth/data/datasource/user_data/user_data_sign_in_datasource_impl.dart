import 'dart:developer';

import 'package:stool_in/core/constants/endpoint_constants.dart';
import 'package:stool_in/core/rest_client/error/rest_client_exception.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/features/auth/data/datasource/user_data/user_data_sign_in_datasource.dart';
import 'package:stool_in/features/auth/data/model/user_data_model.dart';
import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in/features/auth/domain/error/user_data_error.dart';

class UserDataSignInDatasourceImpl implements UserDataSignInDatasource {
  final RestClientPost _restClientPost;
  UserDataSignInDatasourceImpl({
    required RestClientPost restClientPost,
  }) : _restClientPost = restClientPost;
  @override
  Future<UserDataEntity> sendUserData({
    required UserDataModel userDataModel,
  }) async {
    try {
      final result = await _restClientPost.post(
        path: EndpointConstants.postUserData,
        data: userDataModel.toMap(),
      );
      log(result.data.toString());
      return UserDataModel.fromMap(
        result.data,
      );
    } on RestClientException catch (e, s) {
      log(
        'Erro ao postar dados do usuário no datasource impl',
        error: e,
        stackTrace: s,
      );
      if (e.statusCode == 500) {
        throw UserDataError(
          message: 'Usuário já existente',
        );
      }
      throw UserDataError(
        message: 'Erro no servidor, tente mais tarde',
      );
    } on UserDataError catch (e, s) {
      log(
        'Erro ao postar dados do usuário no datasource impl',
        error: e,
        stackTrace: s,
      );

      throw UserDataError(
        message: 'Erro ao fazer cadastro, tente mais tarde',
      );
    } catch (e, s) {
      log('erro desconhecido ao enviar user data a api',
          error: e, stackTrace: s);
      throw UserDataError(
        message: 'Erro ao fazer cadastro, tente mais tarde',
      );
    }
  }
}
