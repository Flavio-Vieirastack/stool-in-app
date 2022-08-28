import 'package:dartz/dartz.dart';
import 'package:stool_in/exports/app_exports.dart';

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