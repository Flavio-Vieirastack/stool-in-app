import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in_app_ui/features/home/domain/usecase/service_provider_usecase.dart';

import '../../domain/entity/service_provider_entity.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ServiceProviderUsecase _serviceProviderUsecase;
  HomeCubit({
    required ServiceProviderUsecase serviceProviderUsecase,
  })  : _serviceProviderUsecase = serviceProviderUsecase,
        super(HomeInitial());

  Future<void> getServiceProviders({required int pageQuantity}) async {
    emit(HomeLoading());
    final result =
        await _serviceProviderUsecase.call(pageQuantity: pageQuantity);
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
