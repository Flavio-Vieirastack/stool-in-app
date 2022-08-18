import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/get_service_providers_params.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/service_provider_entity.dart';
import 'package:stool_in/features/home/domain/usecase/service_provider/service_provider_usecase.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ServiceProviderUsecase _serviceProviderUsecase;
  HomeCubit({
    required ServiceProviderUsecase serviceProviderUsecase,
  })  : _serviceProviderUsecase = serviceProviderUsecase,
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
}
