import 'dart:developer';

import 'package:stool_in_core/stool_in_core.dart';

import '../../../../home/data/model/service_provider/service_provider_model.dart';
import '../../../../home/domain/entity/service_provider/service_provider_entity.dart';
import '../../../domain/error/get_service_provider_unique_error.dart';
import 'get_service_provider_unique_datasource.dart';


class GetServiceProviderUniqueDatasourceImpl
    implements GetServiceProviderUniqueDatasource {
  final RestClientGet _restClientGet;
  GetServiceProviderUniqueDatasourceImpl({
    required RestClientGet restClientGet,
  }) : _restClientGet = restClientGet;
  @override
  Future<ServiceProviderEntity> getServiceProviderUnique({
    required int serviceProviderId,
  }) async {
    try {
      final result = await _restClientGet.get(
          path: EndpointConstants.getServiceProviderDataUnique);
      return ServiceProviderModel.fromDataSource(result.data);
    } on RestClientException catch (e, s) {
      log(
        'Erro ao buscar dados do usuário no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw GetServiceProviderUniqueError(
        message:
            'Erro ao buscar dados do provedor de serviço, tente mais tarde',
      );
    } on GetServiceProviderUniqueError catch (e, s) {
      log(
        'Erro ao buscar dados do usuário no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw GetServiceProviderUniqueError(
        message:
            'Erro ao buscar dados do provedor de serviço, tente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro não mapeado ao buscar dados do provedor de serviço no datasourece impl',
        error: e,
        stackTrace: s,
      );
      throw GetServiceProviderUniqueError(
        message:
            'Erro interno ao buscar dados do provedor de serviço, tente mais tarde',
      );
    }
  }
}
