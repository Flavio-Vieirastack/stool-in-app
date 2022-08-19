import 'package:dartz/dartz.dart';
import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_provider/create_and_update_service_provider_entity.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_provider/service_provider_return_entity.dart';
import 'package:stool_in/features/service_provider/domain/error/create_service_provider_error.dart';

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
