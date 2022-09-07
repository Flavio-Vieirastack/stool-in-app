
import '../../../home/domain/entity/service_provider/service_provider_entity.dart';
import '../model/search_service_provider_model.dart';

abstract class SearchServiceProviderDatasource {
  Future<List<ServiceProviderEntity>> searchServiceProviders({
    required SearchServiceProviderModel serviceProviderModel,
  });
}
