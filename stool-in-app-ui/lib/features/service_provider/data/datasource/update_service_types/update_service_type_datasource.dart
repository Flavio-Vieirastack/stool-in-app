


import '../../../export/service_provider_export.dart';

abstract class UpdateServiceTypeDatasource {
  Future<void> call(
      {required CreateServiceTypeModel createServiceTypeModel});
}
