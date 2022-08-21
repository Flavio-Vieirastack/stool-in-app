import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in/core/helpers/user_actions_helper/cache/cache_user_actions_helper.dart';
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
    final result = await _infoUsecase.getDoubts();
    final cachedDoubts = await _doubtsCachedDatasource.getCachedData();
    result.fold(
        (error) => emit(
              DoubtsErro(
                errorMessage: error.message,
              ),
            ), (sucess) async {
      final userGetActionData =
          await _cacheUserActionsHelper.getUserGetDoubtsData();
      if (userGetActionData == false) {
        log('Call doubts from api', name: 'Info');
        emit(
          DoubtsSucess(
            doubts: sucess,
          ),
        );
        await _cacheUserActionsHelper.setUserGetDoubtsData(value: true);
      } else {
        log('Call doubts from cache', name: 'Info');
        emit(
          DoubtsSucess(
            doubts: cachedDoubts,
          ),
        );
      }
    });
  }
}
