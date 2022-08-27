import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/constants/export/constants_export.dart';
import '../../../../../core/rest_client/export/rest_client_export.dart';
import '../../../export/auth_exports.dart';



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
        data: authModel.toMap(isInResetRequest: true),
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
