import 'dart:developer';
import '../../../../../../exports/app_exports.dart';


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
