import 'dart:developer';
import 'package:stool_in_core/stool_in_core.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:stool_in_logic/src/features/auth/domain/error/firebase_auth_error.dart';
import '../../../domain/entity/user_token_entity.dart';
import '../../../domain/error/api_auth_error.dart';
import '../../model/auth_model.dart';
import '../../model/user_token_model.dart';
import 'login_datasource.dart';
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
    try {
      final result = await _restClientPost.post(
        path: EndpointConstants.login,
        data: authModel.toMap(),
      );
      log('login: ${result.data.toString()}');
      return UserTokenModel.fromMap(result.data);
    } on ApiAuthError catch (e, s) {
      log(
        'Erro ao fazer login na api, no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ApiAuthError(message: 'Erro ao fazer login, tente mais tarde');
    } catch (e, s) {
      log(
        'Erro desconhecido ao fazer login na api, no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ApiAuthError(message: 'Erro no servidor, tente mais tarde');
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
