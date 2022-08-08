import 'package:dartz/dartz.dart';

import '../entity/service_provider_entity.dart';
import '../error/service_provider_error.dart';

abstract class ServiceProviderUsecase {
Future<Either<ServiceProviderError, List<ServiceProviderEntity>>> call({
    required int pageQuantity,
  });
}