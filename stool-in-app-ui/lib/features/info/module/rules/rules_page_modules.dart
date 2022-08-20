import 'package:provider/provider.dart';
import 'package:stool_in/core/constants/routes_constants.dart';
import 'package:stool_in/core/module/main_module/app_module.dart';
import 'package:stool_in/features/info/presenter/page/cubits/rules/rules_cubit.dart';
import 'package:stool_in/features/info/presenter/page/rules/rules_page.dart';

import '../../../../core/module/main_module/inject.dart';
import '../../../../core/rest_client/rest_client_contracts.dart';
import '../../data/datasource/doubts/doubts_datasource.dart';
import '../../data/datasource/doubts/doubts_datasource_impl.dart';
import '../../data/datasource/rules/rules_datasource.dart';
import '../../data/datasource/rules/rules_datasource_impl.dart';
import '../../data/repository/doubts/doubts_repository_impl.dart';
import '../../data/repository/rules/rules_repository_impl.dart';
import '../../domain/repository/doubt/doubt_repository.dart';
import '../../domain/repository/rules/rules_repository.dart';
import '../../domain/usecase/info_usecase.dart';
import '../../domain/usecase/info_usecase_impl.dart';

class RulesPageModules extends AppModule {
  RulesPageModules()
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
            Provider(
              create: (context) => RulesCubit(
                infoUsecase: Inject<InfoUsecase>(context).get(),
              ),
            )
          ],
          routers: {
            RoutesConstants.rulesRoute: (context) => const RulesPage(),
          },
        );
}
