import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:stool_in_core/src/shared/send_email_veirifcation/data/datasource/send_verification_email_datasource.dart';

import '../../domain/error/send_verification_email_error.dart';





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
