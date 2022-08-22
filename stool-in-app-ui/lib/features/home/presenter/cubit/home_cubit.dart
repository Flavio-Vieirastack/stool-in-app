import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in/core/cache/helpers/cubit_emit_cache_data_helper.dart';
import 'package:stool_in/features/home/data/datasource/categories/cache/categories_cached_datasource.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/get_service_providers_params.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/service_provider_entity.dart';
import 'package:stool_in/features/home/domain/usecase/categories/categories_usecase.dart';
import 'package:stool_in/features/home/domain/usecase/service_provider/service_provider_usecase.dart';

import '../../../../core/cache/helpers/user_actions_helper/cache_user_actions_helper.dart';
import '../../domain/entity/categories/categories_entity.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetServiceProviderUsecase _serviceProviderUsecase;
  final CategoriesUsecase _categoriesUsecase;
  final CacheUserActionsHelper _cacheUserActionsHelper;
  final CategoriesCachedDatasource _categoriesCachedDatasource;
  HomeCubit({
    required GetServiceProviderUsecase serviceProviderUsecase,
    required CategoriesUsecase categoriesUsecase,
    required CacheUserActionsHelper cacheUserActionsHelper,
    required CategoriesCachedDatasource categoriesCachedDatasource,
  })  : _serviceProviderUsecase = serviceProviderUsecase,
        _cacheUserActionsHelper = cacheUserActionsHelper,
        _categoriesCachedDatasource = categoriesCachedDatasource,
        _categoriesUsecase = categoriesUsecase,
        super(HomeInitial());

  Future<void> getServiceProviders({required int pageQuantity}) async {
    emit(HomeLoading());
    final result = await _serviceProviderUsecase.call(
      providersParams: GetServiceProvidersParams(
        pageQuantity: pageQuantity,
        currentUserLocationLatitude: 50.0,
        currentUserLocationLongitude: 50.0,
      ),
    );
    result.fold(
      (error) => emit(
        HomeError(message: error.message),
      ),
      (sucess) async {
        emit(
          HomeSucess(serviceProvider: sucess),
        );
      },
    );
  }

  Future<void> getMenuItens() async {
    emit(HomeLoading());
    final falseCondition =
        await _cacheUserActionsHelper.getUserGetCategoriesData();
    final cachedCategories = await _categoriesCachedDatasource.getCachedData();
    CubitEmitCacheDataHelper.returnCachedDataOrApiData(
      falseCondition: falseCondition,
      apiEmition: () async {
        final result = await _categoriesUsecase.call();

        result.fold(
          (error) => emit(
            HomeError(message: error.message),
          ),
          (sucess) => emit(
            HomeSucess(categories: sucess),
          ),
        );
      },
      cacheEmition: () => emit(HomeSucess(categories: cachedCategories)),
      setConditionToTrue: () async =>
          _cacheUserActionsHelper.setUserGetCategoriesData(value: true),
    );
  }
}
