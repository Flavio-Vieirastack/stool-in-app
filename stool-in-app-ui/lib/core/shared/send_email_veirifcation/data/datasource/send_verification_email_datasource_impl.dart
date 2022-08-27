import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../export/shared_export.dart';


class SendVerificationEmailDatasourceImpl
    implements SendVerificationEmailDatasource {
  final FirebaseAuth _firebaseAuth;
  SendVerificationEmailDatasourceImpl({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;
  @override
  Future<void> call() async {
    try {
      await _firebaseAuth.currentUser?.sendEmailVerification();
    } catch (e, s) {
      log('Erro ao enviar email no datasource impl',
          error: e, stackTrace: s);
      throw SendVerificationEmailError(
        message:
            'Erro ao enviar email de verificação, por favor tente mais tarde',
      );
    }
  }
}
