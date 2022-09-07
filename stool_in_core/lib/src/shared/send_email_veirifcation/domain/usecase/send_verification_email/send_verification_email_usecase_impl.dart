import 'package:dartz/dartz.dart';
import 'package:stool_in_core/src/shared/send_email_veirifcation/domain/usecase/send_verification_email/send_verification_email_usecase.dart';

import '../../error/send_verification_email_error.dart';
import '../../repository/send_verification_email/send_verification_email_repository.dart';




class SendVerificationEmailUsecaseImpl implements SendVerificationEmailUsecase {
  final SendVerificationEmailRepository _sendVerificationEmailRepository;
  SendVerificationEmailUsecaseImpl({
    required SendVerificationEmailRepository sendVerificationEmailRepository,
  }) : _sendVerificationEmailRepository = sendVerificationEmailRepository;
  @override
  Future<Either<SendVerificationEmailError, void>> call() async {
    return await _sendVerificationEmailRepository.call();
  }
}
