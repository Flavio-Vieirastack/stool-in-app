import '../../../../../exports/app_exports.dart';

class InfoPageModule extends AppModule {
  InfoPageModule()
      : super(
          routers: {
            RoutesConstants.infoRoute: (context) => const InfoPage(),
          },
        );
}
