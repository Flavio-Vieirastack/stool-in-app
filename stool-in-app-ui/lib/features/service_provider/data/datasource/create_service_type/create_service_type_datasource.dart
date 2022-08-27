

import 'package:stool_in/features/service_provider/export/service_provider_export.dart';

abstract class CreateServiceTypeDatasource {
  Future<ServiceTypesReturnEntity> call({required CreateServiceTypeModel createServiceTypeModel});
}
