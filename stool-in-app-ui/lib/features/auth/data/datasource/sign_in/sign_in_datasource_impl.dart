import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../exports/app_exports.dart';


class SignInDatasourceImpl implements SignInDatasource {
  final RestClientPost _restClientPost;
  final FirebaseAuth _firebaseAuth;
  SignInDatasourceImpl({
    required FirebaseAuth firebaseAuth,
    required RestClientPost restClientPost,
  })  : _firebaseAuth = firebaseAuth,
        _restClientPost = restClientPost;
  @override
  Future<void> apiSignIn({required AuthModel authModel}) async {
    try {
      final result = await _restClientPost.post(
        path: EndpointConstants.signIn,
        data: authModel.toMap(),
      );
      log(result.statucCode.toString());
    } on ApiAuthError catch (e, s) {
      log(
        'Erro ao postar dados na api, no datsource impl',
        error: e,
        stackTrace: s,
      );
      throw ApiAuthError(message: 'Erro ao fazer cadastro, tente mais tarde.');
    } on RestClientException catch (e, s) {
      log(
        'Erro desconhecido ao postar dados na api, no datsource impl',
        error: e,
        stackTrace: s,
      );
      if (e.statusCode == 400) {
        throw ApiAuthError(
          message: 'Erro no servidor, tente novamente mais tarde',
        );
      } else if (e.statusCode == 500) {
        throw ApiAuthError(
          message: 'Usuário já cadastrado',
        );
      }
    }
  }

  @override
  Future<void> firebaseSignIn({required AuthModel authModel}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: authModel.email,
        password: authModel.password ?? '',
      );
    } on FirebaseAuthException catch (e, s) {
      log(
        'Erro ao fazer cadastro no firebase',
        error: e,
        stackTrace: s,
      );
      if (e.code == 'weak-password') {
        throw FirebaseAuthError(message: 'Senha muito fraca');
      } else if (e.code == 'email-already-in-use') {
        throw FirebaseAuthError(message: 'Email já existente');
      }
    } catch (e, s) {
      log(
        'Erro desconhecido ao fazer cadastro no firebase',
        error: e,
        stackTrace: s,
      );
      throw FirebaseAuthError(
        message: 'Erro no servidor, tente mais tarde',
      );
    }
  }
}
