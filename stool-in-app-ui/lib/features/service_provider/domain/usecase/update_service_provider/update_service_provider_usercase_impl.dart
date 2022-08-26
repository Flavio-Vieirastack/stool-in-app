import 'package:stool_in/features/home/domain/error/service_provider/service_provider_error.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/features/service_provider/domain/repository/update_service_provider_repository/update_service_provider_repository.dart';
import 'package:stool_in/features/service_provider/domain/usecase/update_service_provider/update_service_provider_usecase.dart';

import '../../entity/service_provider/create_and_update_service_provider_entity.dart';

class UpdateServiceProviderUsecaseImpl implements UpdateServiceProviderUsecase {
  final UpdateServiceProviderRepository _updateServiceProviderRepository;
  UpdateServiceProviderUsecaseImpl({
    required UpdateServiceProviderRepository updateServiceProviderRepository,
  }) : _updateServiceProviderRepository = updateServiceProviderRepository;
  @override
  Future<Either<ServiceProviderError, void>> call({
    required CreateAndUpdateServiceProviderEntity
        createAndUpdateServiceProviderEntity,
  }) async {
    return await _updateServiceProviderRepository(
      createAndUpdateServiceProviderEntity:
          createAndUpdateServiceProviderEntity,
    );
  }
}
