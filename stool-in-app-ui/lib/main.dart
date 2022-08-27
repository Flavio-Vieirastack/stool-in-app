import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';

import 'core/constants/export/constants_export.dart';
import 'core/firebase/export/firebase_export.dart';
import 'core/module/export/module_export.dart';
import 'core/shared/export/shared_export.dart';
import 'core/widgets/export/widgets_export.dart';
import 'features/auth/export/auth_exports.dart';
import 'features/home/export/home_export.dart';
import 'features/info/export/info_export.dart';
import 'features/onboarding/export/onboarding_export.dart';
import 'features/splash/export/splash_export.dart';
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
                ...DoubtPageModule().routers,
                ...RulesPageModules().routers,
              },
            );
          },
        ),
      ),
    );
  }
}
