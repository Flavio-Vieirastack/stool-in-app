

import '../../../../core/constants/export/constants_export.dart';
import '../../../../core/module/export/module_export.dart';
import '../../export/info_export.dart';

class InfoPageModule extends AppModule {
  InfoPageModule()
      : super(
          routers: {
            RoutesConstants.infoRoute: (context) => const InfoPage(),
          },
        );
}
