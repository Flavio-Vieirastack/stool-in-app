import 'package:dartz/dartz.dart';
import 'package:stool_in/core/shared/domain/error/send_verification_email_error.dart';

abstract class SendVerificationEmailRepository {
  Future<Either<SendVerificationEmailError, void>> call();
}
