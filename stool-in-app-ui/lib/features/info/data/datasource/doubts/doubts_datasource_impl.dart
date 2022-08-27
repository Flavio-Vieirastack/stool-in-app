import 'dart:developer';
import '../../../../../exports/app_exports.dart';


class DoubtsDatasourceImpl extends SaveJsonInCacheDatasource
    implements DoubtsDatasource {
  final RestClientGet _restClientGet;
  final DecodedListCacheHelper _decodedListCacheHelper;
  final CacheUserActionsHelper _cacheUserActionsHelper;
  DoubtsDatasourceImpl({
    required RestClientGet restClientGet,
    required CacheUserActionsHelper cacheUserActionsHelper,
    required DecodedListCacheHelper decodedListCacheHelper,
  })  : _restClientGet = restClientGet,
        _cacheUserActionsHelper = cacheUserActionsHelper,
        _decodedListCacheHelper = decodedListCacheHelper;
  @override
  Future<List<InfoEntity>> getDoubts() async {
    try {
      final unlockCachedData =
          await _cacheUserActionsHelper.getUserGetDoubtsData();
      if (unlockCachedData == false) {
        final result =
            await _restClientGet.get(path: EndpointConstants.getFrequentDoubts);
        final data =
            result.data?.map<InfoEntity>((e) => InfoModel.fromMap(e)).toList();
        await saveJsonInCache(
          data: result.data,
          key: CacheDatasourceKeys.doubtsCacheKey,
        );
        await _cacheUserActionsHelper.setUserGetDoubtsData(value: true);
        return data ?? <InfoEntity>[];
      } else {
        final decodedCacheList = await _decodedListCacheHelper.getDecodedList(
            key: CacheDatasourceKeys.doubtsCacheKey);
        final entityCached =
            decodedCacheList.map((e) => InfoModel.fromMap(e)).toList();

        return entityCached;
      }
    } on RestClientException catch (e, s) {
      log(
        'Erro ao pegar duvidas no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw InfoError(
        message: 'Erro ao buscar duvidas frequentes, tente mais tarde',
      );
    } on InfoError catch (e, s) {
      log(
        'Erro ao pegar duvidas no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw InfoError(
        message: 'Erro ao buscar duvidas frequentes, tente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro ao pegar duvidas no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw InfoError(
        message: 'Erro ao buscar duvidas frequentes, tente mais tarde',
      );
    }
  }
}
