import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';
import 'package:stool_in/core/helpers/theme/app_theme/app_theme.dart';
import 'package:stool_in/features/service_provider/module/service_provider_onboarding_module.dart';
import 'exports/app_exports.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FireBaseNotifications().initializeFirebasePushServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: PermanentDependencies.init(),
      child: BlocListener<InternetConnectionCubit, InternetConnectionState>(
        listener: (context, state) {
          if (state is InternetConnectionNoInternet) {
            showDialog(
              context: context,
              builder: (context) {
                return AppDialog(
                  title: '',
                  context: context,
                  dialogTypes: DialogTypes.noConnection,
                );
              },
            );
          }
        },
        child: FlutterSizer(
          builder: (context, orientation, screenType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppTheme.title,
              theme: AppTheme.theme,
              initialRoute: RoutesConstants.splashRoute,
              routes: {
                ...SplashModule().routers,
                ...OnboardingModule().routers,
                ...LoginModule().routers,
                ...SignInMainModule().routers,
                ...SignInMainDataModule().routers,
                ...PasswordResetModule().routers,
                ...HomeModule().routers,
                ...InfoPageModule().routers,
                ...DoubtPageModule().routers,
                ...RulesPageModules().routers,
                ...ServiceProviderOnboardingModule().routers,
              },
            );
          },
        ),
      ),
    );
  }
}
