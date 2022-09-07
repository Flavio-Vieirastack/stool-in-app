import 'package:dartz/dartz.dart';
import 'package:stool_in_logic/src/features/search/domain/usecase/serarch_service_provider_usecase.dart';

import '../../../home/domain/entity/service_provider/service_provider_entity.dart';
import '../entity/search_service_provider_query_entity.dart';
import '../error/search_service_provider_error.dart';
import '../repository/search_service_provider_repository.dart';

class SearchServiceProviderUsecaseImpl
    implements SerarchServiceProviderUsecase {
  final SearchServiceProviderRepository _searchServiceProviderRepository;
  SearchServiceProviderUsecaseImpl({
    required SearchServiceProviderRepository searchServiceProviderRepository,
  }) : _searchServiceProviderRepository = searchServiceProviderRepository;
  @override
  Future<Either<SearchServiceProviderError, List<ServiceProviderEntity>>>
      call({
    required SearchServiceProviderQueryEntity searchServiceProviderQueryEntity,
  }) async {
    return await _searchServiceProviderRepository.call(searchServiceProviderQueryEntity: searchServiceProviderQueryEntity);
  }
}
