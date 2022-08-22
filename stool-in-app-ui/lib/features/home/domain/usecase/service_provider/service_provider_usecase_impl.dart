import 'package:stool_in/features/home/domain/entity/service_provider/get_service_providers_params.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/service_provider_entity.dart';
import 'package:stool_in/features/home/domain/error/service_provider/service_provider_error.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/features/home/domain/repository/service_provider/service_provider_repository.dart';
import 'package:stool_in/features/home/domain/usecase/service_provider/service_provider_usecase.dart';


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
