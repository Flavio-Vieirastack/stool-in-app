import 'package:dartz/dartz.dart';

import '../../../../home/domain/entity/service_provider/service_provider_entity.dart';
import '../../error/get_service_provider_unique_error.dart';
import '../../repository/get_service_provider_unique/get_service_provider_unique_repository.dart';
import 'get_service_provider_unique_usecase.dart';

class GetServiceProviderUniqueUsecaseImpl
    implements GetServiceProviderUniqueUsecase {
  final GetServiceProviderUniqueRepository _getServiceProviderUniqueRepository;
  GetServiceProviderUniqueUsecaseImpl({
    required GetServiceProviderUniqueRepository
        getServiceProviderUniqueRepository,
  }) : _getServiceProviderUniqueRepository = getServiceProviderUniqueRepository;
  @override
  Future<Either<GetServiceProviderUniqueError, ServiceProviderEntity>> call({
    required int serviceProviderId,
  }) async {
    return await _getServiceProviderUniqueRepository(
      serviceProviderId: serviceProviderId,
    );
  }
}
