import '../../../../exports/app_exports.dart';

abstract class SearchServiceProviderDatasource {
  Future<List<ServiceProviderEntity>> searchServiceProviders({
    required SearchServiceProviderModel serviceProviderModel,
  });
}
