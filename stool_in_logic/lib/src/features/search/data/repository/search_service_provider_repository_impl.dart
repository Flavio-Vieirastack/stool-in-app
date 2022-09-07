import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:stool_in/exports/app_exports.dart';

class SearchServiceProviderRepositoryImpl
    implements SearchServiceProviderRepository {
  final SearchServiceProviderDatasource _searchServiceProviderDatasource;
  SearchServiceProviderRepositoryImpl({
    required SearchServiceProviderDatasource searchServiceProviderDatasource,
  }) : _searchServiceProviderDatasource = searchServiceProviderDatasource;
  @override
  Future<Either<SearchServiceProviderError, List<ServiceProviderEntity>>> call({
    required SearchServiceProviderQueryEntity searchServiceProviderQueryEntity,
  }) async {
    try {
      final result =
          await _searchServiceProviderDatasource.searchServiceProviders(
        serviceProviderModel: SearchServiceProviderModel.fromEntity(
          searchServiceProviderQueryEntity: searchServiceProviderQueryEntity,
        ),
      );
      return Right(result);
    } on SearchServiceProviderError catch (e, s) {
      log('Erro ao fazer busca dos service providers no datasource impl',
          error: e, stackTrace: s);
      return Left(SearchServiceProviderError(message: e.message));
    } catch (e, s) {
      log(
        'Erro desconhecido ao fazer busca dos service providers no datasource impl',
        error: e,
        stackTrace: s,
      );
      return Left(
        SearchServiceProviderError(
          message: 'Erro no servidor, tente mais tarde',
        ),
      );
    }
  }
}
