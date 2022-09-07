import 'package:dartz/dartz.dart';

import '../../../../home/domain/entity/service_provider/service_provider_entity.dart';
import '../../error/get_service_provider_unique_error.dart';


abstract class GetServiceProviderUniqueRepository {
  Future<Either<GetServiceProviderUniqueError, ServiceProviderEntity>> call({
    required int serviceProviderId,
  });
}
