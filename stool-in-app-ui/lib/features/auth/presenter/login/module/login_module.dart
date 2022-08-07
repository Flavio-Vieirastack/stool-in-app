import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stool_in_app_ui/core/constants/routes_constants.dart';
import 'package:stool_in_app_ui/core/module/main_module/app_module.dart';
import 'package:stool_in_app_ui/features/auth/presenter/login/cubit/login_cubit.dart';
import 'package:stool_in_app_ui/features/auth/presenter/login/pages/login_page.dart';


@immutable
class LoginModule extends AppModule {
  LoginModule()
      : super(
          dependencies: [
            Provider<LoginCubit>(
              create: (context) => LoginCubit(),
            )
          ],
          routers: {
            RoutesConstants.loginRoute: (context) => const LoginPage(),
          },
        );
}