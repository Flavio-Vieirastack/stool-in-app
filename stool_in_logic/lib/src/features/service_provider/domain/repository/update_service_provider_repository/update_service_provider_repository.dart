import 'package:dartz/dartz.dart';

import '../../../../home/domain/error/service_provider/service_provider_error.dart';
import '../../entity/service_provider/create_and_update_service_provider_entity.dart';



abstract class UpdateServiceProviderRepository {
  Future<Either<ServiceProviderError, void>> call({
    required CreateAndUpdateServiceProviderEntity
        createAndUpdateServiceProviderEntity,
  });
}
