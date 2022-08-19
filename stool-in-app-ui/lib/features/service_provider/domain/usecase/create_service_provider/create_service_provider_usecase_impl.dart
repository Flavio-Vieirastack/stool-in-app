import 'package:stool_in/features/service_provider/domain/error/create_service_provider_error.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_provider/service_provider_return_entity.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_provider/create_and_update_service_provider_entity.dart';
import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/features/service_provider/domain/repository/create_service_provider/create_service_provider_repository.dart';
import 'package:stool_in/features/service_provider/domain/usecase/create_service_provider/create_service_provider_usecase.dart';

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
  Future<Either<CreateServiceProviderError, void>> updateUserData({
    required UserDataEntity serviceProviderId,
  }) async {
    return await _createServiceProviderRepository
        .sendServiceProviderIdToUserData(serviceProviderId: serviceProviderId);
  }
}
