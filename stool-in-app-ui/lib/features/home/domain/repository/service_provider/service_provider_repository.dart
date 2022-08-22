import 'package:dartz/dartz.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/get_service_providers_params.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/service_provider_entity.dart';
import 'package:stool_in/features/home/domain/error/service_provider/service_provider_error.dart';


abstract class GetServiceProviderRepository {
  Future<Either<ServiceProviderError, List<ServiceProviderEntity>>> call({
    required GetServiceProvidersParams providersParams,
  });
}
