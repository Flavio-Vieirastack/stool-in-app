import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';
import 'package:stool_in/core/constants/routes_constants.dart';
import 'package:stool_in/core/shared/presenter/cubit/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:stool_in/core/widgets/app_dialog/app_dialog.dart';
import 'package:stool_in/core/widgets/app_dialog/enum/dailog_types.dart';
import 'package:stool_in/features/auth/presenter/login/module/login_module.dart';
import 'package:stool_in/features/auth/presenter/password_reset/module/password_reset_module.dart';
import 'package:stool_in/features/auth/presenter/sign_in/module/sign_in_main_module.dart';
import 'package:stool_in/features/auth/presenter/sign_in_user_data/module/sign_in_main_data_module.dart';
import 'package:stool_in/features/home/presenter/module/home_module.dart';
import 'package:stool_in/features/info/module/info/info_page_module.dart';
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
              title: 'StoolIn',
              themeMode: ThemeMode.dark,
              darkTheme: ThemeData.dark(),
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
              },
            );
          },
        ),
      ),
    );
  }
}
