import 'package:dartz/dartz.dart';
import 'package:stool_in/features/service_provider/domain/error/get_service_provider_unique_error.dart';
import 'package:stool_in/features/service_provider/domain/repository/get_service_provider_unique/get_service_provider_unique_repository.dart';
import 'package:stool_in/features/service_provider/domain/usecase/get_service_provider_unique_datasource/get_service_provider_unique_usecase.dart';

import '../../../../../exports/app_exports.dart';

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
