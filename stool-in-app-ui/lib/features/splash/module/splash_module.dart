import 'package:stool_in_app_ui/core/constants/routes_constants.dart';
import 'package:stool_in_app_ui/core/module/app_module.dart';
import 'package:stool_in_app_ui/features/splash/presenter/page/splash_page.dart';

class SplashModule extends AppModule {
  SplashModule()
      : super(
          routers: {
            RoutesConstants.splashRoute: (_) => const SplashPage()
          },
        );
}
