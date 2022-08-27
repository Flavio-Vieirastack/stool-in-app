import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../exports/app_exports.dart';



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
