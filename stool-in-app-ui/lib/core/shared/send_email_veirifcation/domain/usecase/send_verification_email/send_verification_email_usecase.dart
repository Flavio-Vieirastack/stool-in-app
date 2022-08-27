import 'package:dartz/dartz.dart';

import '../../../../../../exports/app_exports.dart';



abstract class SendVerificationEmailUsecase {
  Future<Either<SendVerificationEmailError, void>> call();
}