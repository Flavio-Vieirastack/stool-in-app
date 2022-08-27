import '../../../../../../exports/app_exports.dart';

abstract class UpdateServiceTypeDatasource {
  Future<void> call(
      {required CreateServiceTypeModel createServiceTypeModel});
}
