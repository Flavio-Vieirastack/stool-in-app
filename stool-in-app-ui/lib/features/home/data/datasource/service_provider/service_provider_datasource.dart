import '../../../../../exports/app_exports.dart';

abstract class GetServiceProviderDatasource {
  Future<List<ServiceProviderEntity>> call({
    required GetServiceProvidersParams providersParams,
  });

  int calculateDistance({required RestClientResponse<List<dynamic>> result, required GetServiceProvidersParams params});
}
