import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

import '../page/sign_in_main_data_page.dart';


class SignInMainDataModule extends AppModule {
  SignInMainDataModule()
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
            Provider(
              create: (context) => SignInUserDataCubit(
                fireBaseNotifications:
                    Inject<FireBaseNotifications>(context).get(),
                firebaseAuth: Inject<FirebaseAuth>(context).get(),
                writeLocalSecurityStorage:
                    Inject<WriteLocalSecurityStorage>(context).get(),
                readLocalSecurityStorage:
                    Inject<ReadLocalSecurityStorage>(context).get(),
                authUseCase: Inject<AuthUseCase>(context).get(),
              ),
            )
          ],
          routers: {
            RoutesConstants.signInDataRoute: (context) =>
                const SignInMainDataPage()
          },
        );
}
