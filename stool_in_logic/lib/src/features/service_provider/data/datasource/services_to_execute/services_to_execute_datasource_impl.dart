import 'dart:developer';

import 'package:stool_in/exports/app_exports.dart';
import 'package:stool_in/features/service_provider/data/datasource/services_to_execute/services_to_execute_datasource.dart';
import 'package:stool_in/features/service_provider/domain/error/services_to_execute_error.dart';

class ServicesToExecuteDatasourceImpl implements ServicesToExecuteDatasource {
  final RestClientGet _restClientGet;
  final RestClientDelete _restClientDelete;
  final RestClientPatch _restClientPatch;
  final RestClientPost _restClientPost;
  ServicesToExecuteDatasourceImpl({
    required RestClientDelete restClientDelete,
    required RestClientGet restClientGet,
    required RestClientPost restClientPost,
    required RestClientPatch restClientPatch,
  })  : _restClientDelete = restClientDelete,
        _restClientGet = restClientGet,
        _restClientPost = restClientPost,
        _restClientPatch = restClientPatch;
  @override
  Future<void> createServiceToExecute({
    required ServicesToExecuteModel servicesToExecuteModel,
    required int serviceProviderId,
  }) async {
    try {
      await _restClientPost.post(
        path: '${EndpointConstants.createServicesToExecute}/$serviceProviderId',
        data: servicesToExecuteModel.toMap(),
      );
    } on RestClientException catch (e, s) {
      log(
        'Erro ao criar service to execute no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ServicesToExecuteError(
        message: 'Erro ao criar serviço, tente mais tarde',
      );
    } on ServicesToExecuteError catch (e, s) {
      log(
        'Erro mapeado ao criar service to execute no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ServicesToExecuteError(
        message: 'Erro ao criar serviço, tente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro não mapeado ao criar service to execute no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ServicesToExecuteError(
        message: 'Erro interno ao criar serviço, tente mais tarde',
      );
    }
  }

  @override
  Future<void> deleteServiceToExecute({
    required int serviceToExecuteid,
  }) async {
    try {
      await _restClientDelete.delete(
        path:
            '${EndpointConstants.deleteServicesToExecute}/$serviceToExecuteid',
      );
    } on RestClientException catch (e, s) {
      log(
        'Erro ao deletar service to execute no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ServicesToExecuteError(
        message: 'Erro ao deletar serviço, tente mais tarde',
      );
    } on ServicesToExecuteError catch (e, s) {
      log(
        'Erro mapeado ao deletar service to execute no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ServicesToExecuteError(
        message: 'Erro ao deletar serviço, tente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro não mapeado ao deletar service to execute no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ServicesToExecuteError(
        message: 'Erro interno ao deletar serviço, tente mais tarde',
      );
    }
  }

  @override
  Future<List<ServicesToExecuteEntity>> getAllServicesToExecute() async {
    try {
      final result = await _restClientGet.get<List>(
        path: EndpointConstants.getMyServicesToExecute,
      );
      final data =
          result.data?.map((e) => ServicesToExecuteModel.fromMap(e)).toList();
      return data ?? <ServicesToExecuteEntity>[];
    } on RestClientException catch (e, s) {
      log(
        'Erro ao buscar services to execute no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ServicesToExecuteError(
        message: 'Erro ao buscar serviços, tente mais tarde',
      );
    } on ServicesToExecuteError catch (e, s) {
      log(
        'Erro ao buscar services to execute no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ServicesToExecuteError(
        message: 'Erro ao buscar serviços, tente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro não mapeado ao buscar services to execute no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ServicesToExecuteError(
        message: 'Erro interno ao buscar serviços, tente mais tarde',
      );
    }
  }

  @override
  Future<ServicesToExecuteEntity> getServicesToExecuteUnique({
    required int serviceToExecuteId,
  }) async {
    try {
      final result = await _restClientGet.get(
        path:
            '${EndpointConstants.getServicesToExecuteUnique}/$serviceToExecuteId',
      );
      final data = ServicesToExecuteModel.fromMap(result.data);
      return data;
    } on RestClientException catch (e, s) {
      log(
        'Erro ao pegar dados unique no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ServicesToExecuteError(
        message: 'Erro ao buscar serviço, tente mais tarde',
      );
    } on ServicesToExecuteError catch (e, s) {
      log(
        'Erro mapeado ao pegar dados unique no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ServicesToExecuteError(
        message: 'Erro ao buscar serviço, tente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro não mapeado ao pegar dados unique no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ServicesToExecuteError(
        message: 'Erro interno ao buscar serviço, tente mais tarde',
      );
    }
  }

  @override
  Future<void> updateServicesToExecute({
    required ServicesToExecuteModel servicesToExecuteModel,
    required int serviceToExecuteId,
  }) async {
    try {
      await _restClientPatch.patch(
        path:
            '${EndpointConstants.updateServicesToExecute}/$serviceToExecuteId',
        data: servicesToExecuteModel.toMap(),
      );
    } on RestClientException catch (e, s) {
      log(
        'Erro ao fazer update dos services to execute no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ServicesToExecuteError(
        message: 'Erro ao fazer update dos dados, tente mais tarde',
      );
    } on ServicesToExecuteError catch (e, s) {
      log(
        'Erro mapeado ao fazer update dos services to execute no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ServicesToExecuteError(
        message: 'Erro ao fazer update dos dados, tente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro não mapeado ao fazer update dos services to execute no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ServicesToExecuteError(
        message: 'Erro interno ao fazer update dos dados, tente mais tarde',
      );
    }
  }
}
