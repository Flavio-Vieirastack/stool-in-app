import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/export/constants_export.dart';
import '../../../../../core/firebase/export/firebase_export.dart';
import '../../../../../core/helpers/export/helpers_export.dart';
import '../../../../../core/module/export/module_export.dart';
import '../../../../../core/rest_client/export/rest_client_export.dart';
import '../../../../../core/shared/export/shared_export.dart';
import '../../../export/auth_exports.dart';


class SignInMainModule extends AppModule {
  SignInMainModule()
      : super(
          dependencies: [
            Provider<UserDataSignInDatasource>(
              create: (context) => UserDataSignInDatasourceImpl(
                restClientPost: Inject<RestClientPost>(context).get(),
              ),
            ),
            Provider<UserDataSignInRepository>(
              create: (context) => UserDataSignInRepositoryImpl(
                userDataSignInDatasource:
                    Inject<UserDataSignInDatasource>(context).get(),
              ),
            ),
            Provider<PasswordResetDatasource>(
              create: (context) => PasswordResetDatasourceImpl(
                firebaseAuth: Inject<FirebaseAuth>(context).get(),
                restClientPatch: Inject<RestClientPatch>(context).get(),
              ),
            ),
            Provider<PasswordResetRepository>(
              create: (context) => PasswordResetRepositoryImpl(
                passwordResetDatasource:
                    Inject<PasswordResetDatasource>(context).get(),
              ),
            ),
            Provider<SignInDatasource>(
              create: (context) => SignInDatasourceImpl(
                firebaseAuth: Inject<FirebaseAuth>(context).get(),
                restClientPost: Inject<RestClientPost>(context).get(),
              ),
            ),
            Provider<SignInRepository>(
              create: (context) => SignInRepositoryImpl(
                signInDatasource: Inject<SignInDatasource>(context).get(),
              ),
            ),
            Provider<LoginDatasource>(
              create: (context) => LoginDatasourceImpl(
                restClientPost: Inject<RestClientPost>(context).get(),
                firebaseAuth: Inject<FirebaseAuth>(context).get(),
              ),
            ),
            Provider<LoginRepository>(
              create: (context) => LoginRepositoryImpl(
                loginDatasource: Inject<LoginDatasource>(context).get(),
              ),
            ),
            Provider<AuthUseCase>(
              create: (context) => AuthUsecaseImpl(
                loginRepository: Inject<LoginRepository>(context).get(),
                signInRepository: Inject<SignInRepository>(context).get(),
                passwordResetRepository:
                    Inject<PasswordResetRepository>(context).get(),
                userDataSignInRepository:
                    Inject<UserDataSignInRepository>(context).get(),
              ),
            ),
            Provider<SignInCubit>(
              create: (context) => SignInCubit(
                sendVerificationEmailUsecase:
                    Inject<SendVerificationEmailUsecase>(context).get(),
                fireBaseNotifications:
                    Inject<FireBaseNotifications>(context).get(),
                writeLocalSecurityStorage:
                    Inject<WriteLocalSecurityStorage>(context).get(),
                firebaseAuth: Inject<FirebaseAuth>(context).get(),
                authUseCase: Inject<AuthUseCase>(context).get(),
              ),
            )
          ],
          routers: {
            RoutesConstants.signInMainRoute: (context) => const SignInMainPage()
          },
        );
}
