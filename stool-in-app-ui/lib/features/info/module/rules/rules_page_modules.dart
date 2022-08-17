import 'package:stool_in/core/constants/routes_constants.dart';
import 'package:stool_in/core/module/main_module/app_module.dart';
import 'package:stool_in/features/info/presenter/page/rules/rules_page.dart';

class RulesPageModules extends AppModule {
  RulesPageModules()
      : super(
          routers: {
            RoutesConstants.rulesRoute: (context) => const RulesPage(),
          },
        );
}
