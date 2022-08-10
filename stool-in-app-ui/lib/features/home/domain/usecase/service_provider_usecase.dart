import 'package:dartz/dartz.dart';
import 'package:stool_in/features/home/domain/entity/get_service_providers_params.dart';

import '../entity/service_provider_entity.dart';
import '../error/service_provider_error.dart';

abstract class ServiceProviderUsecase {
Future<Either<ServiceProviderError, List<ServiceProviderEntity>>> call({
    required GetServiceProvidersParams providersParams,
  });
}