import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in/core/module/main_module/inject.dart';
import 'package:stool_in/core/module/permanent_dependencies/permanent_module.dart';
import 'package:stool_in/core/shared/send_email_veirifcation/data/datasource/send_verification_email_datasource.dart';
import 'package:stool_in/core/shared/send_email_veirifcation/data/datasource/send_verification_email_datasource_impl.dart';
import 'package:stool_in/core/shared/send_email_veirifcation/data/repository/send_verification_email_repository_impl.dart';
import 'package:stool_in/core/shared/send_email_veirifcation/domain/repository/send_verification_email/send_verification_email_repository.dart';
import 'package:stool_in/core/shared/send_email_veirifcation/domain/usecase/send_verification_email/send_verification_email_usecase.dart';
import 'package:stool_in/core/shared/send_email_veirifcation/domain/usecase/send_verification_email/send_verification_email_usecase_impl.dart';

class SendEmailVerificationModule implements PermanentModule {
  @override
  List<SingleChildWidget> inject() {
    return [
      Provider<SendVerificationEmailDatasource>(
        create: (context) => SendVerificationEmailDatasourceImpl(
          firebaseAuth: Inject<FirebaseAuth>(context).get(),
        ),
      ),
      Provider<SendVerificationEmailRepository>(
        create: (context) => SendVerificationEmailRepositoryImpl(
          sendVerificationEmailDatasource:
              Inject<SendVerificationEmailDatasource>(context).get(),
        ),
      ),
      Provider<SendVerificationEmailUsecase>(
        create: (context) => SendVerificationEmailUsecaseImpl(
          sendVerificationEmailRepository:
              Inject<SendVerificationEmailRepository>(context).get(),
        ),
      ),
    ];
  }
}
