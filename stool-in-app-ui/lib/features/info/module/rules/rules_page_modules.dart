import 'package:provider/provider.dart';

import '../../../../core/cache/export/cache_export.dart';
import '../../../../core/constants/export/constants_export.dart';
import '../../../../core/module/export/module_export.dart';
import '../../../../core/rest_client/export/rest_client_export.dart';
import '../../export/info_export.dart';


class RulesPageModules extends AppModule {
  RulesPageModules()
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
            Provider(
              create: (context) => RulesCubit(
                cacheUserActionsHelper:
                    Inject<CacheUserActionsHelper>(context).get(),
                infoUsecase: Inject<InfoUsecase>(context).get(),
              ),
            )
          ],
          routers: {
            RoutesConstants.rulesRoute: (context) => const RulesPage(),
          },
        );
}
