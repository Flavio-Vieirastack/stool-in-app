import 'package:dartz/dartz.dart';

import '../../../../auth/export/auth_exports.dart';
import '../../../export/service_provider_export.dart';


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
