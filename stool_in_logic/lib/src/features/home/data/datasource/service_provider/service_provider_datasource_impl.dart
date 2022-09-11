import 'dart:developer';

import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

class GetServiceProviderDatasourceImpl implements GetServiceProviderDatasource {
  final RestClientGet _restClientGet;
  GetServiceProviderDatasourceImpl({
    required RestClientGet restClientGet,
  })  : _restClientGet = restClientGet;

  @override
  Future<List<ServiceProviderEntity>> call({
    required GetServiceProvidersParams providersParams,
  }) async {
    try {
      final result = await _restClientGet.get<List>(
        path: EndpointConstants.getServiceProvider,
        queryParams: {
          'pages': providersParams.pageQuantity,
        },
      );
      final model = result.data
          ?.map((e) => ServiceProviderModel.fromDataSource(e))
          .toList();

      return model ?? <ServiceProviderEntity>[];
    } on ServiceProviderError catch (e, s) {
      log('Erro ao pegar dados do prestador de serviço no datasource impl',
          error: e, stackTrace: s);
      throw ServiceProviderError(
          message: 'Erro ao buscar dados, tente mais tarde');
    } catch (e, s) {
      log(
        'Erro desconhecido ao pegar dados do prestador de serviço no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ServiceProviderError(
          message: 'Erro desconhecido ao pegar dados do usuário');
    }
  }
}
