import 'package:dartz/dartz.dart';

import '../../../../../../exports/app_exports.dart';



abstract class SendVerificationEmailRepository {
  Future<Either<SendVerificationEmailError, void>> call();
}
