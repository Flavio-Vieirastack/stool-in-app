import 'package:stool_in/features/auth/data/model/user_data_model.dart';
import 'package:stool_in/features/service_provider/data/model/create_service_provider/create_and_update_service_provider_model.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_provider/service_provider_return_entity.dart';

abstract class CreateServiceProviderDatasource {
  Future<ServiceProviderReturnEntity> createServiceProvider({
    required CreateAndUpdateServiceProviderModel createAndUpdateServiceProviderModel,
  });
  Future<void> sendServiceProviderIdToUserData({
    required UserDataModel userDataModel,
  });
}
