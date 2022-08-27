

import '../../../../../core/rest_client/export/rest_client_export.dart';
import '../../../export/home_export.dart';

abstract class GetServiceProviderDatasource {
  Future<List<ServiceProviderEntity>> call({
    required GetServiceProvidersParams providersParams,
  });

  int calculateDistance({required RestClientResponse<List<dynamic>> result, required GetServiceProvidersParams params});
}
