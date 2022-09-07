import 'dart:developer';
import '../../../../../../exports/app_exports.dart';


class UpdateServiceProviderDatasourceImpl
    implements UpdateServiceProviderDatasource {
  final RestClientPatch _restClientPatch;
  UpdateServiceProviderDatasourceImpl({
    required RestClientPatch restClientPatch,
  }) : _restClientPatch = restClientPatch;
  @override
  Future<void> call({
    required CreateAndUpdateServiceProviderModel
        createAndUpdateServiceProviderModel,
  }) async {
    try {
      await _restClientPatch.patch(
          path: EndpointConstants.updateServiceProvider,
          data: createAndUpdateServiceProviderModel.toMap());
    } on RestClientException catch (e, s) {
      log(
        'RestClientException ao fazer update do service provider no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ServiceProviderError(
          message: 'Erro ao fazer update dos seus dados, tente mais tarde');
    } on ServiceProviderError catch (e, s) {
      log(
        'ServiceProviderError ao fazer update do service provider no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ServiceProviderError(
          message: 'Erro ao fazer update dos seus dados, tente mais tarde');
    } catch (e, s) {
      log(
        'Erro desconhecido ao fazer update do service provider no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ServiceProviderError(message: 'Erro no servidor, tente mais tarde');
    }
  }
}
