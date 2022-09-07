import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stool_in/features/splash/presenter/page/splash_page.dart';
import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/stool_in_logic.dart';




@immutable
class SplashModule extends AppModule {
  SplashModule()
      : super(
          dependencies: [
            Provider<SecurityAcessHelper>(
              create: (context) => SecurityAcessHelper(),
            ),
            Provider<SplashExecuteCacheActionsHelper>(
              create: (context) => SplashExecuteCacheActionsHelper(),
            ),
            Provider<SplashCubit>(
              create: (context) => SplashCubit(
                splashExecuteCacheActionsHelper:
                    Inject<SplashExecuteCacheActionsHelper>(context).get(),
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
