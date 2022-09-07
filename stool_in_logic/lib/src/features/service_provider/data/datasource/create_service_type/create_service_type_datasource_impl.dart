import 'dart:developer';
import '../../../../../../exports/app_exports.dart';



class CreateServiceTypeDatasourceImpl implements CreateServiceTypeDatasource {
  final RestClientPost _restClientPost;
  CreateServiceTypeDatasourceImpl({
    required RestClientPost restClientPost,
  }) : _restClientPost = restClientPost;
  @override
  Future<ServiceTypesReturnEntity> call({
    required CreateServiceTypeModel createServiceTypeModel,
  }) async {
    try {
      final resut = await _restClientPost.post(
        path:
            '${EndpointConstants.createServiceType}/${createServiceTypeModel.serviceProviderId}',
        data: createServiceTypeModel.toMap(),
      );
      final data = ServiceTypeReturnModel.fromMap(resut.data);
      return data;
    } on RestClientException catch (e, s) {
      log('Erro ao criar service type no datasource impl',
          error: e, stackTrace: s);
      throw CreateServiceTypeError(message: 'Erro ao criar serviço, tente mais tarde');
    } catch(e,s) {
      log('Erro ao criar service type no datasource impl',
          error: e, stackTrace: s);
      throw CreateServiceTypeError(message: 'Erro no servidor ao criar serviço, tente mais tarde');
    }
  }
}
