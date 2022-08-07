import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:stool_in_app_ui/core/constants/endpoint_constants.dart';
import 'package:stool_in_app_ui/features/auth/data/datasource/login/login_datasource.dart';
import 'package:stool_in_app_ui/features/auth/data/model/auth_model.dart';
import 'package:stool_in_app_ui/features/auth/data/model/user_token_model.dart';
import 'package:stool_in_app_ui/features/auth/domain/error/api_auth_error.dart';
import 'package:stool_in_app_ui/features/auth/domain/error/firebase_auth_error.dart';


import '../../../../../core/rest_client/rest_client_contracts.dart';
import '../../../domain/entity/user_token_entity.dart';

class LoginDatasourceImpl implements LoginDatasource {
  final RestClientPost _restClientPost;
  final FirebaseAuth _firebaseAuth;
  LoginDatasourceImpl({
    required RestClientPost restClientPost,
    required FirebaseAuth firebaseAuth,
  })  : _restClientPost = restClientPost,
        _firebaseAuth = firebaseAuth;
  @override
  Future<UserTokenEntity> apiLogin({required AuthModel authModel}) async {
    String? errorMessage;
    try {
      final result = await _restClientPost.post(
        path: EndpointConstants.login,
        data: authModel.toMap(),
      );
      if (result.statucCode == 401) {
        //Unauthorized
        errorMessage = result.data['message'];
      }
      return UserTokenModel.fromJson(result.data);
    } on ApiAuthError catch (e, s) {
      log(
        'Erro ao fazer login na api, no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ApiAuthError(
          message: errorMessage ?? 'Erro ao fazer login, tente mais tarde');
    } catch (e, s) {
      log(
        'Erro desconhecido ao fazer login na api, no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ApiAuthError(
          message: errorMessage ?? 'Erro no servidor tente mais tarde');
    }
  }

  @override
  Future<void> firebaseLogin({required AuthModel authModel}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: authModel.email,
        password: authModel.password ?? '',
      );
    } on FirebaseAuthException catch (e, s) {
      log(
        'Erro ao fazer login no firebase, no datasource impl',
        error: e,
        stackTrace: s,
      );
      if (e.code == 'user-not-found') {
        throw FirebaseAuthError(message: 'Usuário não encontrado');
      } else if (e.code == 'wrong-password') {
        throw FirebaseAuthError(message: 'Senha incorreta');
      }
    } catch (e, s) {
      log(
        'Erro desconhecido ao fazer login no firebase, no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw FirebaseAuthError(message: 'Erro no servidor, tente mais tarde');
    }
  }
}
