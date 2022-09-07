import 'package:dartz/dartz.dart';

import '../../../../auth/domain/entity/user_data_entity.dart';
import '../../entity/service_provider/create_and_update_service_provider_entity.dart';
import '../../entity/service_provider/service_provider_return_entity.dart';
import '../../error/create_service_provider_error.dart';

abstract class CreateServiceProviderUsecase {
  Future<Either<CreateServiceProviderError, ServiceProviderReturnEntity>>
      createServiceProvider({
    required CreateAndUpdateServiceProviderEntity
        createAndUpdateServiceProviderEntity,
  });
  Future<Either<CreateServiceProviderError, void>> sendServiceProviderIdToUserData({
    required UserDataEntity serviceProviderId,
  });
}
