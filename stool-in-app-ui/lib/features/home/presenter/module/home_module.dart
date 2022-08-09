import 'package:stool_in_app_ui/core/constants/routes_constants.dart';
import 'package:stool_in_app_ui/core/module/main_module/app_module.dart';
import 'package:stool_in_app_ui/features/home/presenter/page/home_page.dart';

class HomeModule extends AppModule {
  HomeModule()
      : super(
          routers: {
            RoutesConstants.homeRoute: (context) => const HomePage(),
          },
        );
}
