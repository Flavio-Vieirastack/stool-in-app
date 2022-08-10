import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stool_in/core/constants/routes_constants.dart';
import 'package:stool_in/features/auth/presenter/login/module/login_module.dart';
import 'package:stool_in/features/auth/presenter/password_reset/module/password_reset_module.dart';
import 'package:stool_in/features/auth/presenter/sign_in/module/sign_in_main_module.dart';
import 'package:stool_in/features/auth/presenter/sign_in_user_data/module/sign_in_main_data_module.dart';
import 'package:stool_in/features/home/presenter/module/home_module.dart';
import 'package:stool_in/features/onboarding/module/onboarding_module.dart';
import 'package:stool_in/features/splash/module/splash_module.dart';

import 'core/firebase/push_notifications/firebase_notifications.dart';
import 'core/module/permanent_dependencies/permanent_dependencies.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FireBaseNotifications().initializeFirebasePushServices();
  await FireBaseNotifications().getTokenFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: PermanentDependencies.init(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'StoolIn',
        theme: ThemeData.dark(),
        initialRoute: RoutesConstants.splashRoute,
        routes: {
          ...SplashModule().routers,
          ...OnboardingModule().routers,
          ...LoginModule().routers,
          ...SignInMainModule().routers,
          ...SignInMainDataModule().routers,
          ...PasswordResetModule().routers,
          ...HomeModule().routers,
        },
      ),
    );
  }
}
