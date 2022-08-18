

import 'package:stool_in/core/rest_client/rest_client_response.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/get_service_providers_params.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/service_provider_entity.dart';

abstract class ServiceProviderDatasource {
  Future<List<ServiceProviderEntity>> call({
    required GetServiceProvidersParams providersParams,
  });

  int calculateDistance({required RestClientResponse<List<dynamic>> result, required GetServiceProvidersParams params});
}
