import 'package:stool_in/core/constants/routes_constants.dart';
import 'package:stool_in/core/module/main_module/app_module.dart';
import 'package:stool_in/features/info/presenter/page/info/info_page.dart';

class InfoPageModule extends AppModule {
  InfoPageModule()
      : super(
          routers: {
            RoutesConstants.infoRoute: (context) => const InfoPage(),
          },
        );
}
