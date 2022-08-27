

import '../../../../auth/export/auth_exports.dart';
import '../../../export/service_provider_export.dart';

abstract class CreateServiceProviderDatasource {
  Future<ServiceProviderReturnEntity> createServiceProvider({
    required CreateAndUpdateServiceProviderModel createAndUpdateServiceProviderModel,
  });
  Future<void> sendServiceProviderIdToUserData({
    required UserDataModel userDataModel,
  });
}
