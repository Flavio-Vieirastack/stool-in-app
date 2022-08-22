import 'dart:developer';

import 'package:stool_in/core/cache/keys/cache_datasource_keys.dart';
import 'package:stool_in/core/cache/save_json_in_cache_datasource.dart';
import 'package:stool_in/core/constants/endpoint_constants.dart';
import 'package:stool_in/core/rest_client/error/rest_client_exception.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/features/info/data/datasource/rules/rules_datasource.dart';
import 'package:stool_in/features/info/data/model/info_model.dart';
import 'package:stool_in/features/info/domain/entity/info_entity.dart';
import 'package:stool_in/features/info/domain/error/info_error.dart';

class RulesDatasourceImpl extends SaveJsonInCacheDatasource
    implements RulesDatasource {
  final RestClientGet _restClientGet;
  RulesDatasourceImpl({
    required RestClientGet restClientGet,
  }) : _restClientGet = restClientGet;
  @override
  Future<List<InfoEntity>> getRules() async {
    try {
      final result = await _restClientGet.get(path: EndpointConstants.getRules);
     await saveJsonInCache(
        data: result.data,
        key: CacheDatasourceKeys.rulesCacheKey,
      );
      return result.data?.map<InfoModel>((e) => InfoModel.fromMap(e)).toList();
    } on RestClientException catch (e, s) {
      log(
        'Erro desconhecido ao fazer get das rules',
        error: e,
        stackTrace: s,
      );
      throw InfoError(
        message: 'Erro ao pegar regras, tente mais tarde',
      );
    } on InfoError catch (e, s) {
      log(
        'Erro ao fazer get das rules',
        error: e,
        stackTrace: s,
      );
      throw InfoError(
        message: 'Erro ao pegar regras, tente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro desconhecido ao fazer get das rules',
        error: e,
        stackTrace: s,
      );
      throw Exception();
    }
  }
}
