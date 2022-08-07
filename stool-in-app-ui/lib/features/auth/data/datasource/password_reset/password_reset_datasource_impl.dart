import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:stool_in_app_ui/core/constants/endpoint_constants.dart';
import 'package:stool_in_app_ui/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in_app_ui/features/auth/data/datasource/password_reset/password_reset_datasource.dart';
import 'package:stool_in_app_ui/features/auth/data/model/auth_model.dart';
import 'package:stool_in_app_ui/features/auth/domain/error/api_auth_error.dart';
import 'package:stool_in_app_ui/features/auth/domain/error/firebase_auth_error.dart';


class PasswordResetDatasourceImpl implements PasswordResetDatasource {
  final RestClientPatch _restClientPatch;
  final FirebaseAuth _firebaseAuth;
  PasswordResetDatasourceImpl({
    required FirebaseAuth firebaseAuth,
    required RestClientPatch restClientPatch,
  })  : _firebaseAuth = firebaseAuth,
        _restClientPatch = restClientPatch;
  @override
  Future<void> apiPasswordReset({required AuthModel authModel}) async {
    try {
      await _restClientPatch.patch(
        path: '${EndpointConstants.passwordReset}/${authModel.email}',
        data: authModel.toMap(),
      );
    } on ApiAuthError catch (e, s) {
      log(
        'Erro ao resetar senha do usuário na api, no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ApiAuthError(
        message: 'Erro ao resetar sua senha, tente novamente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro desconhecido ao resetar senha do usuário na api, no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ApiAuthError(
        message: 'Erro no servidor, tente mais tarde',
      );
    }
  }

  @override
  Future<void> firebasePasswordReset({required AuthModel authModel}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: authModel.email);
    } on FirebaseAuthError catch (e, s) {
      log(
        'Erro ao resetar senha do usuario no firebase, no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw FirebaseAuthError(
        message: 'Erro ao resetar sua senha, tente novamente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro desconhecido ao resetar senha do usuario no firebase, no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw FirebaseAuthError(
        message: 'Erro no servidor, tente mais tarde',
      );
    }
  }
}
