

import 'package:dartz/dartz.dart';

import '../../../../../../exports/app_exports.dart';

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
