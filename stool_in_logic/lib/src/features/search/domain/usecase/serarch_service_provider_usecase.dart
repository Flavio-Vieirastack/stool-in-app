import 'package:dartz/dartz.dart';

import '../../../home/domain/entity/service_provider/service_provider_entity.dart';
import '../entity/search_service_provider_query_entity.dart';
import '../error/search_service_provider_error.dart';


abstract class SerarchServiceProviderUsecase {
  Future<Either<SearchServiceProviderError, List<ServiceProviderEntity>>> call({
    required SearchServiceProviderQueryEntity searchServiceProviderQueryEntity,
  });
}
