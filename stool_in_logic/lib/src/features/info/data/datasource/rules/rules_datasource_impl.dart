import 'dart:developer';
import '../../../../../exports/app_exports.dart';

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
