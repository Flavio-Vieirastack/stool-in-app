import 'package:provider/provider.dart';
import 'package:stool_in_app_ui/core/constants/routes_constants.dart';
import 'package:stool_in_app_ui/core/module/app_module.dart';
import 'package:stool_in_app_ui/features/login/presenter/cubit/login_cubit.dart';
import 'package:stool_in_app_ui/features/login/presenter/pages/login_page.dart';

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
