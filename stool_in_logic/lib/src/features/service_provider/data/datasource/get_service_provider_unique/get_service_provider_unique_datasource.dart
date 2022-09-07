
import '../../../../home/domain/entity/service_provider/service_provider_entity.dart';

abstract class GetServiceProviderUniqueDatasource {
  Future<ServiceProviderEntity> getServiceProviderUnique({
    required int serviceProviderId,
  });
}
