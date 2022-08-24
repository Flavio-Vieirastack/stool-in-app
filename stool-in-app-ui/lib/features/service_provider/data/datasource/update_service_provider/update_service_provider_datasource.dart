import 'package:stool_in/features/service_provider/data/model/create_service_provider/create_and_update_service_provider_model.dart';

abstract class UpdateServiceProviderDatasource {
  Future<void> call({required CreateAndUpdateServiceProviderModel createAndUpdateServiceProviderModel});
}
