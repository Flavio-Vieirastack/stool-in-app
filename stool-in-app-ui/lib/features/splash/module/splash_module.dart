import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stool_in/core/constants/routes_constants.dart';
import 'package:stool_in/core/helpers/security_acess_helper/security_acess_helper.dart';
import 'package:stool_in/core/module/main_module/app_module.dart';
import 'package:stool_in/core/module/main_module/inject.dart';
import 'package:stool_in/features/splash/presenter/cubit/splash_cubit.dart';
import 'package:stool_in/features/splash/presenter/page/splash_page.dart';

@immutable
class SplashModule extends AppModule {
  SplashModule()
      : super(
          dependencies: [
            Provider<SecurityAcessHelper>(
              create: (context) => SecurityAcessHelper(),
            ),
            Provider<SplashCubit>(
              create: (context) => SplashCubit(
                firebaseAuth: Inject<FirebaseAuth>(context).get(),
                securityAcessHelper: Inject<SecurityAcessHelper>(context).get(),
              ),
            ),
          ],
          routers: {
            RoutesConstants.splashRoute: (_) => const SplashPage(),
          },
        );
}
