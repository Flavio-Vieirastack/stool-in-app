import '../../../../../exports/app_exports.dart';

abstract class GetServiceProviderUniqueDatasource {
  Future<ServiceProviderEntity> getServiceProviderUnique({
    required int serviceProviderId,
  });
}
