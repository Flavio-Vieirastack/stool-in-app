
import '../../../domain/entity/service_types/service_types_return_entity.dart';
import '../../model/service_type/create_service_type_model.dart';

abstract class CreateServiceTypeDatasource {
  Future<ServiceTypesReturnEntity> call({required CreateServiceTypeModel createServiceTypeModel});
}
