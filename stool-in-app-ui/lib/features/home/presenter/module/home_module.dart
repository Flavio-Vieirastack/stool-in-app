import 'package:provider/provider.dart';
import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

import '../page/home_page.dart';

class HomeModule extends AppModule {
  HomeModule()
      : super(
          dependencies: [
            Provider<GetServiceProviderDatasource>(
              create: (context) => GetServiceProviderDatasourceImpl(
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
            Provider<UserUniqueDatasource>(
              create: (context) => UserUniqueDatasourceImpl(
                restClientGet: Inject<RestClientGet>(context).get(),
              ),
            ),
            Provider<UserUniqueRepository>(
              create: (context) => UserUniqueRepositoryImpl(
                  userUniqueDatasource:
                      Inject<UserUniqueDatasource>(context).get()),
            ),
            Provider<UserUniqueUsecase>(
              create: (context) => UserUniqueUsecaseImpl(
                  userUniqueRepository:
                      Inject<UserUniqueRepository>(context).get()),
            ),
            Provider<HomeCubit>(
              create: (context) => HomeCubit(
                serviceProviderSortListHelper:
                    Inject<ServiceProviderSortListHelper>(context).get(),
                serviceProviderDistanceListCalculate:
                    Inject<ServiceProviderDistanceListCalculate>(context).get(),
                userUniqueUsecase: Inject<UserUniqueUsecase>(context).get(),
                fireBaseNotifications:
                    Inject<FireBaseNotifications>(context).get(),
                userDataUniqueUsecase:
                    Inject<UserDataUniqueUsecase>(context).get(),
                geoLocatorCubit: Inject<GeoLocatorCubit>(context).get(),
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
