import 'package:provider/provider.dart';
import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

import '../../presenter/page/doubt/doubt_page.dart';


class DoubtPageModule extends AppModule {
  DoubtPageModule()
      : super(
          dependencies: [
            Provider<RulesDatasource>(
              create: (context) => RulesDatasourceImpl(
                cacheUserActionsHelper:
                    Inject<CacheUserActionsHelper>(context).get(),
                decodedListCacheHelper:
                    Inject<DecodedListCacheHelper>(context).get(),
                restClientGet: Inject<RestClientGet>(context).get(),
              ),
            ),
            Provider<DoubtsDatasource>(
              create: (context) => DoubtsDatasourceImpl(
                cacheUserActionsHelper:
                    Inject<CacheUserActionsHelper>(context).get(),
                decodedListCacheHelper:
                    Inject<DecodedListCacheHelper>(context).get(),
                restClientGet: Inject<RestClientGet>(context).get(),
              ),
            ),
            Provider<DoubtRepository>(
              create: (context) => DoubtsRepositoryImpl(
                doubtsDatasource: Inject<DoubtsDatasource>(context).get(),
              ),
            ),
            Provider<RulesRepository>(
              create: (context) => RulesRepositoryImpl(
                rulesDatasource: Inject<RulesDatasource>(context).get(),
              ),
            ),
            Provider<InfoUsecase>(
              create: (context) => InfoUsecaseImpl(
                rulesRepository: Inject<RulesRepository>(context).get(),
                doubtRepository: Inject<DoubtRepository>(context).get(),
              ),
            ),
            Provider<DoubtsCubit>(
              create: (context) => DoubtsCubit(
                cacheUserActionsHelper:
                    Inject<CacheUserActionsHelper>(context).get(),
                infoUsecase: Inject<InfoUsecase>(context).get(),
              ),
            ),
          ],
          routers: {
            RoutesConstants.doubtRoute: (context) => const DoubtPage(),
          },
        );
}
