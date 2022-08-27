import 'package:dartz/dartz.dart';

import '../../../../export/shared_export.dart';


abstract class SendVerificationEmailRepository {
  Future<Either<SendVerificationEmailError, void>> call();
}
