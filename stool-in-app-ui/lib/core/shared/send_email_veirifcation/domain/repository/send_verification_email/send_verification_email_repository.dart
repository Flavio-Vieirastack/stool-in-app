import 'package:dartz/dartz.dart';

import '../../error/send_verification_email_error.dart';

abstract class SendVerificationEmailRepository {
  Future<Either<SendVerificationEmailError, void>> call();
}
