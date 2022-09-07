
import 'package:stool_in_core/stool_in_core.dart';

import '../../presenter/page/info/info_page.dart';

class InfoPageModule extends AppModule {
  InfoPageModule()
      : super(
          routers: {
            RoutesConstants.infoRoute: (context) => const InfoPage(),
          },
        );
}
