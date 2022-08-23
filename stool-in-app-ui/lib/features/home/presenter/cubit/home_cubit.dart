import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/get_service_providers_params.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/service_provider_entity.dart';
import 'package:stool_in/features/home/domain/usecase/categories/categories_usecase.dart';
import 'package:stool_in/features/home/domain/usecase/service_provider/service_provider_usecase.dart';

import '../../domain/entity/categories/categories_entity.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetServiceProviderUsecase _serviceProviderUsecase;
  final CategoriesUsecase _categoriesUsecase;
  HomeCubit({
    required GetServiceProviderUsecase serviceProviderUsecase,
    required CategoriesUsecase categoriesUsecase,
  })  : _serviceProviderUsecase = serviceProviderUsecase,
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
    final result = await _categoriesUsecase.call();

    result.fold(
      (error) => emit(
        HomeError(message: error.message),
      ),
      (sucess) => emit(
        HomeSucess(categories: sucess),
      ),
    );
  }
}
