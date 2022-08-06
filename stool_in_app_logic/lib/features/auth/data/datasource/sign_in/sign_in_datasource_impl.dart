import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:stool_in_app_logic/core/constants/endpoint_constants.dart';
import 'package:stool_in_app_logic/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in_app_logic/features/auth/data/datasource/sign_in/sign_in_datasource.dart';
import 'package:stool_in_app_logic/features/auth/data/model/auth_model.dart';
import 'package:stool_in_app_logic/features/auth/domain/error/api_auth_error.dart';
import 'package:stool_in_app_logic/features/auth/domain/error/firebase_auth_error.dart';

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
      await _restClientPost.post(
        path: EndpointConstants.signIn,
        data: authModel.toMap(),
      );
    } on ApiAuthError catch (e, s) {
      log(
        'Erro ao postar dados na api, no datsource impl',
        error: e,
        stackTrace: s,
      );
      throw ApiAuthError(message: 'Erro ao fazer cadastro');
    } catch (e, s) {
      log(
        'Erro desconhecido ao postar dados na api, no datsource impl',
        error: e,
        stackTrace: s,
      );
      throw ApiAuthError(
        message: 'Erro no servidor, tente novamente mais tarde',
      );
    }
  }

  @override
  Future<void> firebaseSignIn({required AuthModel authModel}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: authModel.email,
        password: authModel.password,
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
