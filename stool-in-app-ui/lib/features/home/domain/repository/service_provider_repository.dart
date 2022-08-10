import 'package:dartz/dartz.dart';
import 'package:stool_in/features/home/domain/entity/service_provider_entity.dart';
import 'package:stool_in/features/home/domain/error/service_provider_error.dart';

import '../entity/get_service_providers_params.dart';

abstract class ServiceProviderRepository {
  Future<Either<ServiceProviderError, List<ServiceProviderEntity>>> call({
    required GetServiceProvidersParams providersParams,
  });
}
