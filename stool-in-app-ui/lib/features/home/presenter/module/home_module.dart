import 'package:provider/provider.dart';
import 'package:stool_in/core/constants/routes_constants.dart';
import 'package:stool_in/core/helpers/distance_helper/distance_helper_calculate.dart';
import 'package:stool_in/core/module/main_module/app_module.dart';
import 'package:stool_in/core/module/main_module/inject.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/features/home/data/datasource/categories/categories_datasource.dart';
import 'package:stool_in/features/home/data/datasource/categories/categories_datasource_impl.dart';
import 'package:stool_in/features/home/data/datasource/service_provider/service_provider_datasource.dart';
import 'package:stool_in/features/home/data/datasource/service_provider/service_provider_datasource_impl.dart';
import 'package:stool_in/features/home/data/repository/categories/categories_repository_impl.dart';
import 'package:stool_in/features/home/data/repository/service_provider/service_provider_repository_impl.dart';
import 'package:stool_in/features/home/domain/repository/categories/categories_repository.dart';
import 'package:stool_in/features/home/domain/repository/service_provider/service_provider_repository.dart';
import 'package:stool_in/features/home/domain/usecase/categories/categories_usecase.dart';
import 'package:stool_in/features/home/domain/usecase/categories/categories_usecase_impl.dart';
import 'package:stool_in/features/home/domain/usecase/service_provider/service_provider_usecase.dart';
import 'package:stool_in/features/home/domain/usecase/service_provider/service_provider_usecase_impl.dart';
import 'package:stool_in/features/home/presenter/cubit/home_cubit.dart';
import 'package:stool_in/features/home/presenter/page/home_page.dart';

class HomeModule extends AppModule {
  HomeModule()
      : super(
          dependencies: [
            Provider<ServiceProviderDatasource>(
              create: (context) => ServiceProviderDatasourceImpl(
                distanceHelperCalculate:
                    Inject<DistanceHelperCalculate>(context).get(),
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
            Provider<CategoriesDatasource>(
              create: (context) => CategoriesDatasourceImpl(
                restClientGet: Inject<RestClientGet>(context).get(),
              ),
            ),
            Provider<CategoriesRepository>(
              create: (context) => CategoriesRepositoryImpl(
                categoriesDatasource:
                    Inject<CategoriesDatasource>(context).get(),
              ),
            ),
            Provider<CategoriesUsecase>(
              create: (context) => CategoriesUsecaseImpl(
                categoriesRepository:
                    Inject<CategoriesRepository>(context).get(),
              ),
            ),
            Provider<HomeCubit>(
              create: (context) => HomeCubit(
                categoriesUsecase: Inject<CategoriesUsecase>(context).get(),
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
