import 'package:stool_in_app_ui/core/constants/routes_constants.dart';
import 'package:stool_in_app_ui/core/module/main_module/app_module.dart';
import 'package:stool_in_app_ui/features/auth/sign_in_user_data/presenter/page/sign_in_main_data_page.dart';

class SignInMainDataModule extends AppModule {
  SignInMainDataModule()
      : super(
          routers: {
            RoutesConstants.signInDataRoute: (context) =>
                const SignInMainDataPage()
          },
        );
}
