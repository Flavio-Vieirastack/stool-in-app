import 'dart:developer';

import 'package:stool_in/core/constants/endpoint_constants.dart';
import 'package:stool_in/core/rest_client/error/rest_client_exception.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/features/info/data/datasource/doubts/doubts_datasource.dart';
import 'package:stool_in/features/info/data/model/info_model.dart';
import 'package:stool_in/features/info/domain/entity/info_entity.dart';
import 'package:stool_in/features/info/domain/error/info_error.dart';

class DoubtsDatasourceImpl implements DoubtsDatasource {
  final RestClientGet _restClientGet;
  DoubtsDatasourceImpl({
    required RestClientGet restClientGet,
  }) : _restClientGet = restClientGet;
  @override
  Future<List<InfoEntity>> getDoubts() async {
    try {
      final result = await _restClientGet.get<List>(
          path: EndpointConstants.getFrequentDoubts);
      final data = result.data?.map((e) => InfoModel.fromMap(e)).toList();
      return data ?? <InfoEntity>[];
    } on RestClientException catch (e, s) {
      log('Erro ao pegar duvidas no datasource impl', error: e, stackTrace: s);
      throw InfoError(
          message: 'Erro ao buscar duvidas frequentes, tente mais tarde');
    } on InfoError catch (e, s) {
      log('Erro ao pegar duvidas no datasource impl', error: e, stackTrace: s);
      throw InfoError(
          message: 'Erro ao buscar duvidas frequentes, tente mais tarde');
    } catch (e, s) {
      log('Erro ao pegar duvidas no datasource impl', error: e, stackTrace: s);
      throw InfoError(
        message: 'Erro ao buscar duvidas frequentes, tente mais tarde',
      );
    }
  }
}