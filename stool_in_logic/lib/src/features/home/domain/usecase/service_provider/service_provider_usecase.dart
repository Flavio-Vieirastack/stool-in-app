import 'package:dartz/dartz.dart';

import 'package:stool_in_logic/src/features/home/domain/entity/service_provider/service_provider_entity.dart';
import '../../error/service_provider/service_provider_error.dart';


abstract class GetServiceProviderUsecase {
Future<Either<ServiceProviderError, List<ServiceProviderEntity>>> call({
    required int pageQuantity,
  });
}