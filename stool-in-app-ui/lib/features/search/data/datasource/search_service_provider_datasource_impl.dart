import 'dart:developer';

import '../../../../exports/app_exports.dart';

class SearchServiceProviderDatasourceImpl
    implements SearchServiceProviderDatasource {
  final RestClientGet _restClientGet;
  SearchServiceProviderDatasourceImpl({
    required RestClientGet restClientGet,
  }) : _restClientGet = restClientGet;
  @override
  Future<List<ServiceProviderEntity>> searchServiceProviders({
    required SearchServiceProviderModel serviceProviderModel,
  }) async {
    try {
      final result = await _restClientGet.get(
        path: EndpointConstants.searchServiceProvider,
        queryParams: serviceProviderModel.toMap(),
      );
      final data = result.data
          ?.map<ServiceProviderEntity>(
              (e) => ServiceProviderModel.fromDataSource(e))
          .toList();
      return data ?? <ServiceProviderEntity>[];
    } on RestClientException catch (e, s) {
      log(
        'Erro ao fazer busca do service provider no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw SearchServiceProviderError(
        message: 'Erro ao buscar prestadores de serviço, tente mais tarde',
      );
    } on SearchServiceProviderError catch (e, s) {
      log(
        'Erro ao fazer busca do service provider no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw SearchServiceProviderError(
        message: 'Erro ao buscar prestadores de serviço, tente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro desconhecido ao fazer busca do service provider no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw SearchServiceProviderError(
        message:
            'Erro no servidor ao buscar prestadores de serviço, tente mais tarde',
      );
    }
  }
}
