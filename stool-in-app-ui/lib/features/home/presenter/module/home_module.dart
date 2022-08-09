import 'package:provider/provider.dart';
import 'package:stool_in_app_ui/core/constants/routes_constants.dart';
import 'package:stool_in_app_ui/core/module/main_module/app_module.dart';
import 'package:stool_in_app_ui/core/module/main_module/inject.dart';
import 'package:stool_in_app_ui/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in_app_ui/features/home/data/datasource/service_provider_datasource.dart';
import 'package:stool_in_app_ui/features/home/data/datasource/service_provider_datasource_impl.dart';
import 'package:stool_in_app_ui/features/home/data/repository/service_provider_repository_impl.dart';
import 'package:stool_in_app_ui/features/home/domain/repository/service_provider_repository.dart';
import 'package:stool_in_app_ui/features/home/domain/usecase/service_provider_usecase.dart';
import 'package:stool_in_app_ui/features/home/domain/usecase/service_provider_usecase_impl.dart';
import 'package:stool_in_app_ui/features/home/presenter/cubit/home_cubit.dart';
import 'package:stool_in_app_ui/features/home/presenter/page/home_page.dart';

class HomeModule extends AppModule {
  HomeModule()
      : super(
          dependencies: [
            Provider<ServiceProviderDatasource>(
              create: (context) => ServiceProviderDatasourceImpl(
                restClientGet: Inject<RestClientGet>(context).get(),
              ),
            ),
            Provider<ServiceProviderRepository>(
              create: (context) => ServiceProviderRepositoryImpl(
                serviceProviderDatasource:
                    Inject<ServiceProviderDatasource>(context).get(),
              ),
            ),
            Provider<ServiceProviderUsecase>(
              create: (context) => ServiceProviderUsecaseImpl(
                serviceProviderRepository:
                    Inject<ServiceProviderRepository>(context).get(),
              ),
            ),
            Provider<HomeCubit>(
              create: (context) => HomeCubit(
                serviceProviderUsecase:
                    Inject<ServiceProviderUsecase>(context).get(),
              ),
            )
          ],
          routers: {
            RoutesConstants.homeRoute: (context) => const HomePage(),
          },
        );
}
