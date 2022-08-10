import 'package:stool_in/features/home/domain/error/service_provider_error.dart';
import 'package:stool_in/features/home/domain/entity/service_provider_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/features/home/domain/repository/service_provider_repository.dart';
import 'package:stool_in/features/home/domain/usecase/service_provider_usecase.dart';

import '../entity/get_service_providers_params.dart';

class ServiceProviderUsecaseImpl implements ServiceProviderUsecase {
  final ServiceProviderRepository _serviceProviderRepository;
  ServiceProviderUsecaseImpl({
    required ServiceProviderRepository serviceProviderRepository,
  }) : _serviceProviderRepository = serviceProviderRepository;
  @override
  Future<Either<ServiceProviderError, List<ServiceProviderEntity>>> call({
    required GetServiceProvidersParams providersParams
  }) async {
    return await _serviceProviderRepository.call(providersParams: providersParams);
  }
}
