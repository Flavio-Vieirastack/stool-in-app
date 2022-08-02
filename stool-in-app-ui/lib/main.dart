import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stool_in_app_ui/core/constants/routes_constants.dart';
import 'package:stool_in_app_ui/core/permanent_dependencies/permanent_dependencies.dart';
import 'package:stool_in_app_ui/features/login/module/login_module.dart';
import 'package:stool_in_app_ui/features/onboarding/module/onboarding_module.dart';
import 'package:stool_in_app_ui/features/splash/module/splash_module.dart';

void main() {
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
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        initialRoute: RoutesConstants.splashRoute,
        routes: {
          ...SplashModule().routers,
          ...OnboardingModule().routers,
          ...LoginModule().routers,
        },
      ),
    );
  }
}
