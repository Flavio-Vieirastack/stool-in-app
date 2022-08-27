import 'package:dartz/dartz.dart';

import '../../../../export/shared_export.dart';


abstract class SendVerificationEmailUsecase {
  Future<Either<SendVerificationEmailError, void>> call();
}