
import '../../../../auth/data/model/user_data_model.dart';
import '../../../domain/entity/service_provider/service_provider_return_entity.dart';
import '../../model/service_provider/create_and_update_service_provider_model.dart';

abstract class CreateServiceProviderDatasource {
  Future<ServiceProviderReturnEntity> createServiceProvider({
    required CreateAndUpdateServiceProviderModel createAndUpdateServiceProviderModel,
  });
  Future<void> sendServiceProviderIdToUserData({
    required UserDataModel userDataModel,
  });
}
