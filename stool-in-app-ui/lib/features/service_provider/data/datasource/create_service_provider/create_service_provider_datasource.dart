import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_provider/create_and_update_service_provider_entity.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_provider/service_provider_return_entity.dart';

abstract class CreateServiceProviderDatasource {
  Future<ServiceProviderReturnEntity> createServiceProvider({
    required CreateAndUpdateServiceProviderEntity
        createAndUpdateServiceProviderEntity,
  });
  Future<void> sendServiceProviderIdToUserData({
    required UserDataEntity userDataEntity,
  });
}
