import 'dart:developer';

import 'package:stool_in_app_ui/core/constants/endpoint_constants.dart';
import 'package:stool_in_app_ui/core/rest_client/error/rest_client_exception.dart';
import 'package:stool_in_app_ui/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in_app_ui/features/auth/data/datasource/user_data/user_data_sign_in_datasource.dart';
import 'package:stool_in_app_ui/features/auth/data/model/user_data_model.dart';
import 'package:stool_in_app_ui/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in_app_ui/features/auth/domain/error/user_data_error.dart';

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
      final result = await _restClientPost.post<Map<String, dynamic>>(
        path: EndpointConstants.postUserData,
        data: userDataModel.toMap(),
      );
      return UserDataModel.fromMap(
        result.data ?? {},
      );
    } on UserDataError catch (e, s) {
      log(
        'Erro ao postar dados do usuário no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw UserDataError(
        message: 'Erro no servidor, tente mais tarde',
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
        message: 'Erro ao fazer cadastro, tente mais tarde',
      );
    }
  }
}
