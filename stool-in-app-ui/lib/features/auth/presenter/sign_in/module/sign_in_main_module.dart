import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:stool_in_app_ui/core/constants/routes_constants.dart';

import 'package:stool_in_app_ui/core/firebase/push_notifications/firebase_notifications.dart';
import 'package:stool_in_app_ui/core/helpers/secure_storage_helper/secure_storage_contracts.dart';
import 'package:stool_in_app_ui/core/module/main_module/app_module.dart';
import 'package:stool_in_app_ui/core/module/main_module/inject.dart';
import 'package:stool_in_app_ui/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in_app_ui/features/auth/data/datasource/login/login_datasource.dart';
import 'package:stool_in_app_ui/features/auth/data/datasource/login/login_datasource_impl.dart';
import 'package:stool_in_app_ui/features/auth/data/datasource/password_reset/password_reset_datasource.dart';
import 'package:stool_in_app_ui/features/auth/data/datasource/password_reset/password_reset_datasource_impl.dart';
import 'package:stool_in_app_ui/features/auth/data/datasource/sign_in/sign_in_datasource.dart';
import 'package:stool_in_app_ui/features/auth/data/datasource/sign_in/sign_in_datasource_impl.dart';
import 'package:stool_in_app_ui/features/auth/data/datasource/user_data/user_data_sign_in_datasource.dart';
import 'package:stool_in_app_ui/features/auth/data/datasource/user_data/user_data_sign_in_datasource_impl.dart';
import 'package:stool_in_app_ui/features/auth/data/repository/login/login_repository_impl.dart';
import 'package:stool_in_app_ui/features/auth/data/repository/password_reset/password_reset_repository_impl.dart';
import 'package:stool_in_app_ui/features/auth/data/repository/sign_in/sign_in_repository_impl.dart';
import 'package:stool_in_app_ui/features/auth/data/repository/user_data/user_data_sign_in_repository_impl.dart';
import 'package:stool_in_app_ui/features/auth/domain/repository/login/login_repository.dart';
import 'package:stool_in_app_ui/features/auth/domain/repository/password_reset/password_reset_repository.dart';
import 'package:stool_in_app_ui/features/auth/domain/repository/sign_in/sign_in_repository.dart';
import 'package:stool_in_app_ui/features/auth/domain/repository/user_data/user_data_sign_in_respository.dart';
import 'package:stool_in_app_ui/features/auth/domain/usecase/auth/auth_use_case.dart';
import 'package:stool_in_app_ui/features/auth/domain/usecase/auth/auth_usecase_impl.dart';
import 'package:stool_in_app_ui/features/auth/presenter/sign_in/cubit/sign_in_cubit.dart';
import 'package:stool_in_app_ui/features/auth/presenter/sign_in/page/sign_in_main_page.dart';


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
