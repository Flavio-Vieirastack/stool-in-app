import 'package:provider/provider.dart';

import '../../../../exports/app_exports.dart';

class HomeModule extends AppModule {
  HomeModule()
      : super(
          dependencies: [
            Provider<ServiceProviderDatasourceCalculateDistance>(
              create: (context) => ServiceProviderDatasourceCalculateDistance(
                distanceHelperCalculate:
                    Inject<DistanceHelperCalculate>(context).get(),
              ),
            ),
            Provider<GetServiceProviderDatasource>(
              create: (context) => GetServiceProviderDatasourceImpl(
                serviceProviderDatasourceCalculateDistance:
                    Inject<ServiceProviderDatasourceCalculateDistance>(context)
                        .get(),
                restClientGet: Inject<RestClientGet>(context).get(),
              ),
            ),
            Provider<GetServiceProviderRepository>(
              create: (context) => GetServiceProviderRepositoryImpl(
                serviceProviderDatasource:
                    Inject<GetServiceProviderDatasource>(context).get(),
              ),
            ),
            Provider<GetServiceProviderUsecase>(
              create: (context) => GetServiceProviderUsecaseImpl(
                serviceProviderRepository:
                    Inject<GetServiceProviderRepository>(context).get(),
              ),
            ),
            Provider<CategoriesDatasource>(
              create: (context) => CategoriesDatasourceImpl(
                cacheUserActionsHelper:
                    Inject<CacheUserActionsHelper>(context).get(),
                decodedListCacheHelper:
                    Inject<DecodedListCacheHelper>(context).get(),
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
                    Inject<GetServiceProviderUsecase>(context).get(),
              ),
            )
          ],
          routers: {
            RoutesConstants.homeRoute: (context) => const HomePage(),
          },
        );
}
