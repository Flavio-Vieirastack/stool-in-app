import 'package:stool_in/features/service_provider/data/model/service_type/create_service_type_model.dart';


abstract class UpdateServiceTypeDatasource {
  Future<void> call(
      {required CreateServiceTypeModel createServiceTypeModel});
}
