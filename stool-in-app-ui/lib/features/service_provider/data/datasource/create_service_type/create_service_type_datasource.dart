import 'package:stool_in/features/service_provider/data/model/service_type/create_service_type_model.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/service_types_return_entity.dart';

abstract class CreateServiceTypeDatasource {
  Future<ServiceTypesReturnEntity> call({required CreateServiceTypeModel createServiceTypeModel});
}
