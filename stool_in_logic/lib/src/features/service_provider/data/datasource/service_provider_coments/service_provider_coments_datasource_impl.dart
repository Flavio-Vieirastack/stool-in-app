import 'dart:developer';

import 'package:stool_in/exports/app_exports.dart';
import 'package:stool_in/features/service_provider/data/datasource/service_provider_coments/service_provider_coments_datasource.dart';
import 'package:stool_in/features/service_provider/domain/error/coments_error.dart';

class ServiceProviderComentsDatasourceImpl
    implements ServiceProviderComentsDatasource {
  final RestClientDelete _restClientDelete;
  final RestClientGet _restClientGet;
  final RestClientPost _restClientPost;
  final RestClientPatch _restClientPatch;
  ServiceProviderComentsDatasourceImpl({
    required RestClientDelete restClientDelete,
    required RestClientGet restClientGet,
    required RestClientPatch restClientPatch,
    required RestClientPost restClientPost,
  })  : _restClientDelete = restClientDelete,
        _restClientGet = restClientGet,
        _restClientPatch = restClientPatch,
        _restClientPost = restClientPost;
  @override
  Future<void> createComent({
    required ComentsModel comentsModel,
    required int serviceProviderId,
  }) async {
    try {
      await _restClientPost.post(
        path: '${EndpointConstants.createComent}/$serviceProviderId',
        data: comentsModel.toMap(),
      );
    } on RestClientException catch (e, s) {
      log(
        'Erro ao criar comentario no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ComentsError(message: 'Erro ao criar comentário, tente mais tarde');
    } on ComentsError catch (e, s) {
      log(
        'Erro mapeado ao criar comentario no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ComentsError(message: 'Erro ao criar comentário, tente mais tarde');
    } catch (e, s) {
      log(
        'Erro não mapeado ao criar comentario no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ComentsError(
        message: 'Erro interno ao criar comentário, tente mais tarde',
      );
    }
  }

  @override
  Future<void> deleteComent({
    required int comentId,
  }) async {
    try {
      await _restClientDelete.delete(
          path: '${EndpointConstants.deletemyComent}/$comentId');
    } on RestClientException catch (e, s) {
      log(
        'Erro ao deletar comentário no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ComentsError(
        message: 'Erro ao deletar comentário, tente mais tarde',
      );
    } on ComentsError catch (e, s) {
      log(
        'Erro mapeado ao deletar comentário no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ComentsError(
        message: 'Erro ao deletar comentário, tente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro não mapeado ao deletar comentário no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ComentsError(
        message: 'Erro interno ao deletar comentário, tente mais tarde',
      );
    }
  }

  @override
  Future<List<ComentsEntity>> getAllMyComents() async {
    try {
      final result =
          await _restClientGet.get<List>(path: EndpointConstants.myComents);
      final data = result.data?.map((e) => ComentsModel.fromMap(e)).toList();
      return data ?? <ComentsModel>[];
    } on RestClientException catch (e, s) {
      log(
        'Erro ao buscar comentários no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ComentsError(
        message: 'Erro ao buscar comentários, tente mais tarde',
      );
    } on ComentsError catch (e, s) {
      log(
        'Erro mapeado ao buscar comentários no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ComentsError(
        message: 'Erro ao buscar comentários, tente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro não mapeado ao buscar comentários no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ComentsError(
        message: 'Erro interno ao buscar comentários, tente mais tarde',
      );
    }
  }

  @override
  Future<ComentsEntity> getUniqueComent({
    required int comentId,
  }) async {
    try {
      final result = await _restClientGet.get(path: EndpointConstants.myComent);
      final data = ComentsModel.fromMap(result.data);
      return data;
    } on RestClientException catch (e, s) {
      log(
        'Erro ao buscar comentario no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ComentsError(
        message: 'Erro ao buscar comentário, tente mais tarde',
      );
    } on ComentsError catch (e, s) {
      log(
        'Erro mapeado ao buscar comentario no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ComentsError(
        message: 'Erro ao buscar comentário, tente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro não mapeado ao buscar comentario no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ComentsError(
        message: 'Erro interno ao buscar comentário, tente mais tarde',
      );
    }
  }

  @override
  Future<void> updateComent({
    required ComentsModel comentsModel,
    required int serviceProviderId,
  }) async {
    try {
      await _restClientPatch.patch(
        path: '${EndpointConstants.updateComent}/$serviceProviderId',
        data: comentsModel.toMap(),
      );
    } on RestClientException catch (e, s) {
      log(
        'Erro ao fazer update dos comentario no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ComentsError(
        message:
            'Erro ao fazer atualização do seu comentário, tente mais tarde',
      );
    } on ComentsError catch (e, s) {
      log(
        'Erro mapeado ao fazer update dos comentario no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ComentsError(
        message:
            'Erro ao fazer atualização do seu comentário, tente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro não mapeado ao fazer update dos comentario no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ComentsError(
        message:
            'Erro interno ao fazer atualização do seu comentário, tente mais tarde',
      );
    }
  }
}
