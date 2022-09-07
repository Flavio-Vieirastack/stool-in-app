import 'package:dartz/dartz.dart';
import 'package:stool_in_logic/src/features/home/domain/usecase/service_provider/service_provider_usecase.dart';
import 'package:stool_in_logic/src/features/home/domain/entity/service_provider/service_provider_entity.dart';
import '../../entity/service_provider/get_service_providers_params.dart';
import '../../error/service_provider/service_provider_error.dart';
import '../../repository/service_provider/service_provider_repository.dart';



class GetServiceProviderUsecaseImpl implements GetServiceProviderUsecase {
  final GetServiceProviderRepository _serviceProviderRepository;
  GetServiceProviderUsecaseImpl({
    required GetServiceProviderRepository serviceProviderRepository,
  }) : _serviceProviderRepository = serviceProviderRepository;
  @override
  Future<Either<ServiceProviderError, List<ServiceProviderEntity>>> call({
    required GetServiceProvidersParams providersParams
  }) async {
    return await _serviceProviderRepository.call(providersParams: providersParams);
  }
}
