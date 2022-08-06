import 'package:stool_in_app_logic/core/constants/routes_constants.dart';
import 'package:stool_in_app_ui/core/module/main_module/app_module.dart';
import 'package:stool_in_app_ui/features/auth/sign_in/presenter/page/sign_in_main_page.dart';

class SignInMainModule extends AppModule {
  SignInMainModule()
      : super(
          routers: {
            RoutesConstants.signInMainRoute: (context) => const SignInMainPage()
          },
        );
}
