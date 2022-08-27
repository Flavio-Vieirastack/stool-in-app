import 'dart:developer';

import '../../../../../core/constants/export/constants_export.dart';
import '../../../../../core/rest_client/export/rest_client_export.dart';
import '../../../export/auth_exports.dart';



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
