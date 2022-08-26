import 'dart:developer';

import 'package:stool_in/core/constants/endpoint_constants.dart';
import 'package:stool_in/core/rest_client/error/rest_client_exception.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/features/service_provider/data/datasource/delete_user_service_type/delete_user_service_type_datasource.dart';
import 'package:stool_in/features/service_provider/domain/error/delete_service_type_error.dart';

class DeleteUserServiceTypeDatasourceImpl
    implements DeleteUserServiceTypeDatasource {
  final RestClientDelete _restClientDelete;
  DeleteUserServiceTypeDatasourceImpl({
    required RestClientDelete restClientDelete,
  }) : _restClientDelete = restClientDelete;
  @override
  Future<void> deleteUserServiceType({required int id}) async {
    try {
      await _restClientDelete.delete(
        path: '${EndpointConstants.deleteUserServiceTypes}/$id',
      );
    } on RestClientException catch (e, s) {
      log(
        'Erro ao fazer delete do service type no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw DeleteServiceTypeError(
          message: 'Erro ao deletar serviço, tente mais tarde');
    } on DeleteServiceTypeError catch (e, s) {
      log(
        'Erro mapeado ao fazer delete do service type no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw DeleteServiceTypeError(
          message: 'Erro ao deletar serviço, tente mais tarde');
    } catch (e, s) {
      log(
        'Erro não mapeado ao fazer delete do service type no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw DeleteServiceTypeError(
        message: 'Erro no servidor ao deletar serviço, tente mais tarde',
      );
    }
  }
}
