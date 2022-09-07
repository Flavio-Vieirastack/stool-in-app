

import 'package:dartz/dartz.dart';

import '../../../../auth/domain/entity/user_data_entity.dart';
import '../../entity/service_provider/create_and_update_service_provider_entity.dart';
import '../../entity/service_provider/service_provider_return_entity.dart';
import '../../error/create_service_provider_error.dart';
import '../../repository/create_service_provider/create_service_provider_repository.dart';
import 'create_service_provider_usecase.dart';


class CreateServiceProviderUsecaseImpl implements CreateServiceProviderUsecase {
  final CreateServiceProviderRepository _createServiceProviderRepository;
  CreateServiceProviderUsecaseImpl({
    required CreateServiceProviderRepository createServiceProviderRepository,
  }) : _createServiceProviderRepository = createServiceProviderRepository;
  @override
  Future<Either<CreateServiceProviderError, ServiceProviderReturnEntity>>
      createServiceProvider({
    required CreateAndUpdateServiceProviderEntity
        createAndUpdateServiceProviderEntity,
  }) async {
    return await _createServiceProviderRepository.createServiceProvider(
        createAndUpdateServiceProviderEntity:
            createAndUpdateServiceProviderEntity);
  }

  @override
  Future<Either<CreateServiceProviderError, void>> sendServiceProviderIdToUserData({
    required UserDataEntity serviceProviderId,
  }) async {
    return await _createServiceProviderRepository
        .sendServiceProviderIdToUserData(serviceProviderId: serviceProviderId);
  }
}
