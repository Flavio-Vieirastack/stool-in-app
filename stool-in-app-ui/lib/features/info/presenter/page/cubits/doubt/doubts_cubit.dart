import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in/core/cache/helpers/user_actions_helper/cache_user_actions_helper.dart';
import 'package:stool_in/core/cache/helpers/cubit_emit_cache_data_helper.dart';
import 'package:stool_in/features/info/data/datasource/doubts/cache/doubts_cached_datasource.dart';
import 'package:stool_in/features/info/domain/entity/info_entity.dart';
import 'package:stool_in/features/info/domain/usecase/info_usecase.dart';

part 'doubts_state.dart';

class DoubtsCubit extends Cubit<DoubtsState> {
  final InfoUsecase _infoUsecase;
  final DoubtsCachedDatasource _doubtsCachedDatasource;
  final CacheUserActionsHelper _cacheUserActionsHelper;
  DoubtsCubit({
    required InfoUsecase infoUsecase,
    required CacheUserActionsHelper cacheUserActionsHelper,
    required DoubtsCachedDatasource doubtsCachedDatasource,
  })  : _infoUsecase = infoUsecase,
        _cacheUserActionsHelper = cacheUserActionsHelper,
        _doubtsCachedDatasource = doubtsCachedDatasource,
        super(DoubtsInitial());
  Future<void> getDoubts() async {
    emit(DoubtsLoading());

    final cachedDoubts = await _doubtsCachedDatasource.getCachedData();
    final getUserGetDoubtsData =
        await _cacheUserActionsHelper.getUserGetDoubtsData();
    CubitEmitCacheDataHelper.returnCachedDataOrApiData(
      falseCondition: getUserGetDoubtsData,
      apiEmition: () async {
        final result = await _infoUsecase.getDoubts();
        result.fold(
          (error) {
            emit(
              DoubtsErro(
                errorMessage: error.message,
              ),
            );
          },
          (sucess) async {
            emit(
              DoubtsSucess(doubts: sucess),
            );
          },
        );
      },
      cacheEmition: () => emit(
        DoubtsSucess(doubts: cachedDoubts),
      ),
      setConditionToTrue: () async =>
          _cacheUserActionsHelper.setUserGetDoubtsData(value: true),
    );
  }
}

