import '../../../../../../exports/app_exports.dart';

abstract class CreateServiceProviderDatasource {
  Future<ServiceProviderReturnEntity> createServiceProvider({
    required CreateAndUpdateServiceProviderModel createAndUpdateServiceProviderModel,
  });
  Future<void> sendServiceProviderIdToUserData({
    required UserDataModel userDataModel,
  });
}
