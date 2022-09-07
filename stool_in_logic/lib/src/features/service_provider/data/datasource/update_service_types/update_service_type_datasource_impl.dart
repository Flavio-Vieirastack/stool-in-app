import 'dart:developer';

import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/src/features/service_provider/data/datasource/update_service_types/update_service_type_datasource.dart';

import '../../../domain/error/update_service_types_error.dart';
import '../../model/service_type/create_service_type_model.dart';


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
