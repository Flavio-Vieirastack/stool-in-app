import 'package:stool_in/core/constants/routes_constants.dart';
import 'package:stool_in/core/module/main_module/app_module.dart';
import 'package:stool_in/features/info/presenter/page/doubt/doubt_page.dart';

class DoubtPageModule extends AppModule {
  DoubtPageModule()
      : super(
          routers: {
            RoutesConstants.doubtRoute: (context) => const DoubtPage(),
          },
        );
}
