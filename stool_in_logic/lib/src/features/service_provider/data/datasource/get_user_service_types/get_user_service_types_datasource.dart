
import '../../../domain/entity/service_types/create_service_types_entity.dart';
import '../../../domain/entity/service_types/service_types_return_entity.dart';

abstract class GetUserServiceTypesDatasource {
  Future<List<ServiceTypesReturnEntity>> getUserServicesTypes({
    required CreateServiceTypesEntity serviceProviderId,
  });
}
