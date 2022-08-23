import 'package:dartz/dartz.dart';
import 'package:stool_in/features/home/domain/error/service_provider/service_provider_error.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_provider/create_and_update_service_provider_entity.dart';

abstract class UpdateServiceProviderUsecase {
  Future<Either<ServiceProviderError, void>> call({
    required CreateAndUpdateServiceProviderEntity
        createAndUpdateServiceProviderEntity,
  });
}
