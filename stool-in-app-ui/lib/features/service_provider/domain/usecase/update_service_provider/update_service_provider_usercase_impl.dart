import '../../../../home/export/home_export.dart';
import '../../../export/service_provider_export.dart';
import 'package:dartz/dartz.dart';


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
