import 'package:dartz/dartz.dart';

import '../../../../../../exports/app_exports.dart';



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
