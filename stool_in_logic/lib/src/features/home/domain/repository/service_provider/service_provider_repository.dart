import 'package:dartz/dartz.dart';

import 'package:stool_in_logic/src/features/home/domain/entity/service_provider/service_provider_entity.dart';
import '../../entity/service_provider/get_service_providers_params.dart';
import '../../error/service_provider/service_provider_error.dart';


abstract class GetServiceProviderRepository {
  Future<Either<ServiceProviderError, List<ServiceProviderEntity>>> call({
    required GetServiceProvidersParams providersParams,
  });
}
