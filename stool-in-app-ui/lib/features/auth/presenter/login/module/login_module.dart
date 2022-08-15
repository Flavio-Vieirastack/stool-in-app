import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stool_in/core/constants/routes_constants.dart';
import 'package:stool_in/core/firebase/push_notifications/firebase_notifications.dart';
import 'package:stool_in/core/helpers/secure_storage_helper/secure_storage_contracts.dart';
import 'package:stool_in/core/module/main_module/app_module.dart';
import 'package:stool_in/core/module/main_module/inject.dart';
import 'package:stool_in/core/shared/presenter/cubit/geo_locator_cubit/geo_locator_cubit.dart';
import 'package:stool_in/core/shared/send_email_veirifcation/domain/usecase/send_verification_email/send_verification_email_usecase.dart';
import 'package:stool_in/features/auth/domain/usecase/auth/auth_use_case.dart';
import 'package:stool_in/features/auth/presenter/login/cubit/login_cubit.dart';
import 'package:stool_in/features/auth/presenter/login/pages/login_page.dart';
import 'package:stool_in/features/auth/presenter/sign_in/cubit/sign_in_cubit.dart';

import '../../../../../core/rest_client/rest_client_contracts.dart';
import '../../../data/datasource/login/login_datasource.dart';
import '../../../data/datasource/login/login_datasource_impl.dart';
import '../../../data/datasource/password_reset/password_reset_datasource.dart';
import '../../../data/datasource/password_reset/password_reset_datasource_impl.dart';
import '../../../data/datasource/sign_in/sign_in_datasource.dart';
import '../../../data/datasource/sign_in/sign_in_datasource_impl.dart';
import '../../../data/repository/login/login_repository_impl.dart';
import '../../../data/repository/password_reset/password_reset_repository_impl.dart';
import '../../../data/repository/sign_in/sign_in_repository_impl.dart';
import '../../../domain/repository/login/login_repository.dart';
import '../../../domain/repository/password_reset/password_reset_repository.dart';
import '../../../domain/repository/sign_in/sign_in_repository.dart';
import '../../../domain/repository/user_data/user_data_sign_in_respository.dart';
import '../../../domain/usecase/auth/auth_usecase_impl.dart';

@immutable
class LoginModule extends AppModule {
  LoginModule()
      : super(
          dependencies: [
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
              create: (context) => SignInCubit(
                authUseCase: Inject<AuthUseCase>(context).get(),
                firebaseAuth: Inject<FirebaseAuth>(context).get(),
                sendVerificationEmailUsecase:
                    Inject<SendVerificationEmailUsecase>(context).get(),
                writeLocalSecurityStorage:
                    Inject<WriteLocalSecurityStorage>(context).get(),
                fireBaseNotifications:
                    Inject<FireBaseNotifications>(context).get(),
              ),
            ),
            Provider<LoginCubit>(
              create: (context) => LoginCubit(
                readLocalSecurityStorage:
                    Inject<ReadLocalSecurityStorage>(context).get(),
                signInCubit: Inject<SignInCubit>(context).get(),
                sendVerificationEmailUsecase:
                    Inject<SendVerificationEmailUsecase>(context).get(),
                firebaseAuth: Inject<FirebaseAuth>(context).get(),
                geoLocatorCubit: Inject<GeoLocatorCubit>(context).get(),
                writeLocalSecurityStorage:
                    Inject<WriteLocalSecurityStorage>(context).get(),
                authUseCase: Inject<AuthUseCase>(context).get(),
              ),
            ),
          ],
          routers: {
            RoutesConstants.loginRoute: (context) => const LoginPage(),
          },
        );
}
