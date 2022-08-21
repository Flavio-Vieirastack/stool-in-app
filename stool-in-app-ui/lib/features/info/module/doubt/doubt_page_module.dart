import 'package:provider/provider.dart';
import 'package:stool_in/core/cache/cache_datasource_helper.dart';
import 'package:stool_in/core/constants/routes_constants.dart';
import 'package:stool_in/core/module/main_module/app_module.dart';
import 'package:stool_in/core/module/main_module/inject.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/features/info/data/datasource/doubts/cache/doubts_cached_datasource.dart';
import 'package:stool_in/features/info/data/datasource/doubts/doubts_datasource.dart';
import 'package:stool_in/features/info/data/datasource/doubts/doubts_datasource_impl.dart';
import 'package:stool_in/features/info/data/datasource/rules/rules_datasource.dart';
import 'package:stool_in/features/info/data/datasource/rules/rules_datasource_impl.dart';
import 'package:stool_in/features/info/data/repository/doubts/doubts_repository_impl.dart';
import 'package:stool_in/features/info/data/repository/rules/rules_repository_impl.dart';
import 'package:stool_in/features/info/domain/repository/doubt/doubt_repository.dart';
import 'package:stool_in/features/info/domain/repository/rules/rules_repository.dart';
import 'package:stool_in/features/info/domain/usecase/info_usecase.dart';
import 'package:stool_in/features/info/domain/usecase/info_usecase_impl.dart';
import 'package:stool_in/features/info/presenter/page/cubits/doubt/doubts_cubit.dart';
import 'package:stool_in/features/info/presenter/page/doubt/doubt_page.dart';

class DoubtPageModule extends AppModule {
  DoubtPageModule()
      : super(
          dependencies: [
            Provider<RulesDatasource>(
              create: (context) => RulesDatasourceImpl(
                restClientGet: Inject<RestClientGet>(context).get(),
              ),
            ),
            Provider<DoubtsDatasource>(
              create: (context) => DoubtsDatasourceImpl(
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
            Provider<DoubtsCachedDatasource>(
              create: (context) => DoubtsCachedDatasource(
                cacheDatasourceHelper:
                    Inject<CacheDatasourceHelper>(context).get(),
              ),
            ),
            Provider<DoubtsCubit>(
              create: (context) => DoubtsCubit(
                doubtsCachedDatasource:
                    Inject<DoubtsCachedDatasource>(context).get(),
                infoUsecase: Inject<InfoUsecase>(context).get(),
              ),
            ),
          ],
          routers: {
            RoutesConstants.doubtRoute: (context) => const DoubtPage(),
          },
        );
}
