import '../../../../../../exports/app_exports.dart';

abstract class CreateServiceTypeDatasource {
  Future<ServiceTypesReturnEntity> call({required CreateServiceTypeModel createServiceTypeModel});
}
