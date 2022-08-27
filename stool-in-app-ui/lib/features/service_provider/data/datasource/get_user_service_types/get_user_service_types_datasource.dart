

import '../../../export/service_provider_export.dart';

abstract class GetUserServiceTypesDatasource {
  Future<List<ServiceTypesReturnEntity>> getUserServicesTypes({
    required CreateServiceTypesEntity serviceProviderId,
  });
}
