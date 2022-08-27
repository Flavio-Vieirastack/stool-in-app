import 'dart:developer';

import '../../../../../core/constants/export/constants_export.dart';
import '../../../../../core/rest_client/export/rest_client_export.dart';
import '../../../export/service_provider_export.dart';


class UpdateServiceTypeDatasourceImpl implements UpdateServiceTypeDatasource {
  final RestClientPatch _restClientPatch;
  UpdateServiceTypeDatasourceImpl({required RestClientPatch restClientPatch})
      : _restClientPatch = restClientPatch;
  @override
  Future<void> call({
    required CreateServiceTypeModel createServiceTypeModel,
  }) async {
    try {
      await _restClientPatch.patch(
        path:
            '${EndpointConstants.createServiceType}/${createServiceTypeModel.serviceProviderId}',
        data: createServiceTypeModel.toMap(),
      );
    } on RestClientException catch (e, s) {
      log(
        'Erro ao fazer update do service type no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw UpdateServiceTypesError(
        message: 'Erro ao atualizar os serviço, tente mais tarde',
      );
    } on UpdateServiceTypesError catch (e, s) {
      log(
        'Erro ao fazer update do service type no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw UpdateServiceTypesError(
        message: 'Erro ao atualizar os serviço, tente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro desconhecido ao fazer update do service type no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw UpdateServiceTypesError(
        message: 'Erro no servidor ao atualizar os serviço, tente mais tarde',
      );
    }
  }
}
