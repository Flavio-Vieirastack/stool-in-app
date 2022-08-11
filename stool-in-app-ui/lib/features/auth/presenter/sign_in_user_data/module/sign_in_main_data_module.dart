import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:stool_in/core/constants/routes_constants.dart';
import 'package:stool_in/core/firebase/push_notifications/firebase_notifications.dart';
import 'package:stool_in/core/helpers/secure_storage_helper/secure_storage_contracts.dart';
import 'package:stool_in/core/module/main_module/app_module.dart';
import 'package:stool_in/features/auth/data/datasource/sign_in/sign_in_datasource_impl.dart';
import 'package:stool_in/features/auth/presenter/sign_in_user_data/cubit/sign_in_user_data_cubit.dart';
import 'package:stool_in/features/auth/presenter/sign_in_user_data/page/sign_in_main_data_page.dart';

import '../../../../../core/module/main_module/inject.dart';
import '../../../../../core/rest_client/rest_client_contracts.dart';
import '../../../data/datasource/login/login_datasource.dart';
import '../../../data/datasource/login/login_datasource_impl.dart';
import '../../../data/datasource/password_reset/password_reset_datasource.dart';
import '../../../data/datasource/password_reset/password_reset_datasource_impl.dart';
import '../../../data/datasource/sign_in/sign_in_datasource.dart';
import '../../../data/datasource/user_data/user_data_sign_in_datasource.dart';
import '../../../data/datasource/user_data/user_data_sign_in_datasource_impl.dart';
import '../../../data/repository/login/login_repository_impl.dart';
import '../../../data/repository/password_reset/password_reset_repository_impl.dart';
import '../../../data/repository/sign_in/sign_in_repository_impl.dart';
import '../../../data/repository/user_data/user_data_sign_in_repository_impl.dart';
import '../../../domain/repository/login/login_repository.dart';
import '../../../domain/repository/password_reset/password_reset_repository.dart';
import '../../../domain/repository/sign_in/sign_in_repository.dart';
import '../../../domain/repository/user_data/user_data_sign_in_respository.dart';
import '../../../domain/usecase/auth/auth_use_case.dart';
import '../../../domain/usecase/auth/auth_usecase_impl.dart';

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
                removeLocalSecurityStorage:
                    Inject<RemoveLocalSecurityStorage>(context).get(),
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
