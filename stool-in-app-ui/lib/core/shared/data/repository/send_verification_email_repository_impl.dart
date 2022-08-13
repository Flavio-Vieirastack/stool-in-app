import 'dart:developer';

import 'package:stool_in/core/shared/data/datasource/send_verification_email_datasource.dart';
import 'package:stool_in/core/shared/domain/error/send_verification_email_error.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/core/shared/domain/repository/send_verification_email/send_verification_email_repository.dart';

class SendVerificationEmailRepositoryImpl
    implements SendVerificationEmailRepository {
  final SendVerificationEmailDatasource _sendVerificationEmailDatasource;
  SendVerificationEmailRepositoryImpl({
    required SendVerificationEmailDatasource sendVerificationEmailDatasource,
  }) : _sendVerificationEmailDatasource = sendVerificationEmailDatasource;
  @override
  Future<Either<SendVerificationEmailError, void>> call() async {
    try {
      final result = await _sendVerificationEmailDatasource.call();
      return Right(result);
    } catch (e, s) {
      log('Erro ao enviar email para o usuário', error: e, stackTrace: s);
      return Left(
        SendVerificationEmailError(
          message:
              'Desculpe, ocorreu um erro ao enviar email, tente mais tarde',
        ),
      );
    }
  }
}
