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

import '../../../../../core/cache/helpers/decoded_list_cache_helper.dart';
import '../../../../../core/cache/helpers/user_actions_helper/cache_user_actions_helper.dart';

class RulesDatasourceImpl extends SaveJsonInCacheDatasource
    implements RulesDatasource {
  final RestClientGet _restClientGet;
  final DecodedListCacheHelper _decodedListCacheHelper;
  final CacheUserActionsHelper _cacheUserActionsHelper;
  RulesDatasourceImpl({
    required RestClientGet restClientGet,
    required CacheUserActionsHelper cacheUserActionsHelper,
    required DecodedListCacheHelper decodedListCacheHelper,
  })  : _restClientGet = restClientGet,
        _decodedListCacheHelper = decodedListCacheHelper,
        _cacheUserActionsHelper = cacheUserActionsHelper;
  @override
  Future<List<InfoEntity>> getRules() async {
    try {
      final unlockCachedData =
          await _cacheUserActionsHelper.getUserGetRulesData();
      if (unlockCachedData == false) {
        final result = await _restClientGet.get(
          path: EndpointConstants.getRules,
        );
        await saveJsonInCache(
          data: result.data,
          key: CacheDatasourceKeys.rulesCacheKey,
        );
        final apiData =
            result.data?.map<InfoModel>((e) => InfoModel.fromMap(e)).toList();
        await _cacheUserActionsHelper.setUserGetRulesData(value: true);
        return apiData;
      } else {
        final decodedCacheList = await _decodedListCacheHelper.getDecodedList(
            key: CacheDatasourceKeys.rulesCacheKey);
        final entityCached =
            decodedCacheList.map((e) => InfoModel.fromMap(e)).toList();

        return entityCached;
      }
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
