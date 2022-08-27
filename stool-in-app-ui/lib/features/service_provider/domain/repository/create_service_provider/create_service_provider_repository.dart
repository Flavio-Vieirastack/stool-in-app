import 'package:dartz/dartz.dart';

import '../../../../../../exports/app_exports.dart';


abstract class CreateServiceProviderRepository {
  Future<Either<CreateServiceProviderError, ServiceProviderReturnEntity>>
      createServiceProvider({
    required CreateAndUpdateServiceProviderEntity
        createAndUpdateServiceProviderEntity,
  });
  Future<Either<CreateServiceProviderError, void>> sendServiceProviderIdToUserData({
    required UserDataEntity serviceProviderId,
  });
}
