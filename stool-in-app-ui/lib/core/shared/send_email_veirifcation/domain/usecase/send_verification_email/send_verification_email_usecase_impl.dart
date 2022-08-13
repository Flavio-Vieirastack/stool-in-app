import 'package:dartz/dartz.dart';
import 'package:stool_in/core/shared/send_email_veirifcation/domain/error/send_verification_email_error.dart';
import 'package:stool_in/core/shared/send_email_veirifcation/domain/repository/send_verification_email/send_verification_email_repository.dart';
import 'package:stool_in/core/shared/send_email_veirifcation/domain/usecase/send_verification_email/send_verification_email_usecase.dart';

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
