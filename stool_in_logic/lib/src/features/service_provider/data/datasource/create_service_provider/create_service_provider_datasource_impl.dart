import 'dart:developer';

import 'package:stool_in_core/stool_in_core.dart';

import '../../../../auth/data/model/user_data_model.dart';
import '../../../domain/entity/service_provider/service_provider_return_entity.dart';
import '../../../domain/error/create_service_provider_error.dart';
import '../../model/service_provider/create_and_update_service_provider_model.dart';
import '../../model/service_provider/service_provider_return_model.dart';
import 'create_service_provider_datasource.dart';




class CreateServiceProviderDatasourceImpl
    implements CreateServiceProviderDatasource {
  final RestClientPost _restClientPost;
  final RestClientPatch _restClientPatch;
  CreateServiceProviderDatasourceImpl({
    required RestClientPost restClientPost,
    required RestClientPatch restClientPatch,
  })  : _restClientPatch = restClientPatch,
        _restClientPost = restClientPost;
  @override
  Future<ServiceProviderReturnEntity> createServiceProvider({
    required CreateAndUpdateServiceProviderModel
        createAndUpdateServiceProviderModel,
  }) async {
    try {
      final result = await _restClientPost.post(
        path: EndpointConstants.createServiceProvider,
        data: createAndUpdateServiceProviderModel.toMap(),
      );
      return ServiceProviderReturnModel.fromMap(result.data);
    } on RestClientException catch (e, s) {
      log('Erro ao criar provedor de serviço no datasource impl',
          error: e, stackTrace: s);
      throw CreateServiceProviderError(
        message: 'Erro ao enviar seus dados, tente mais tarde',
      );
    } on CreateServiceProviderError catch (e, s) {
      log('Erro ao criar provedor de serviço no datasource impl',
          error: e, stackTrace: s);
      throw CreateServiceProviderError(
        message: 'Erro ao enviar seus dados, tente mais tarde',
      );
    } catch (e, s) {
      log('Erro desconhecido ao criar provedor de serviço no datasource impl',
          error: e, stackTrace: s);
      throw CreateServiceProviderError(
        message: 'Erro no servidor, tente novamente mais tarde',
      );
    }
  }

  @override
  Future<void> sendServiceProviderIdToUserData({
    required UserDataModel userDataModel,
  }) async {
    try {
      await _restClientPatch.patch(
        path: EndpointConstants.updateUserData,
        data: userDataModel.toMap(),
      );
    } on RestClientException catch (e, s) {
      log(
        'Erro ao atualizar id do service provider no user data, no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw CreateServiceProviderError(
        message: 'Erro ao enviar seus dados, tente mais tarde',
      );
    } on CreateServiceProviderError catch (e,s) {
       log(
        'Erro ao atualizar id do service provider no user data, no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw CreateServiceProviderError(
        message: 'Erro ao enviar seus dados, tente mais tarde',
      );
    } catch(e,s) {
      log(
        'Erro desconhecido ao atualizar id do service provider no user data, no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw CreateServiceProviderError(
        message: 'Erro no servidor, tente novamente mais tarde',
      );
    }
  }
}
