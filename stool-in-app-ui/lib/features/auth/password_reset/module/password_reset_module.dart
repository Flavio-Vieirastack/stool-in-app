import 'package:stool_in_app_ui/core/constants/routes_constants.dart';
import 'package:stool_in_app_ui/core/module/main_module/app_module.dart';
import 'package:stool_in_app_ui/features/auth/password_reset/presenter/page/password_reset_page.dart';

class PasswordResetModule extends AppModule {
  PasswordResetModule()
      : super(
          routers: {
            RoutesConstants.passwordRecoveryRoute: (context) =>
                const PasswordResetPage()
          },
        );
}
