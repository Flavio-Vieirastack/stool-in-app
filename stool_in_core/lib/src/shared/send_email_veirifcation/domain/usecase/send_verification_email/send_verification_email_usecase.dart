import 'package:dartz/dartz.dart';

import '../../error/send_verification_email_error.dart';




abstract class SendVerificationEmailUsecase {
  Future<Either<SendVerificationEmailError, void>> call();
}