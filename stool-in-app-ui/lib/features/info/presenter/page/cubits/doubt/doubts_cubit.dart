import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in/features/info/data/datasource/doubts/cache/doubts_cached_datasource.dart';
import 'package:stool_in/features/info/domain/entity/info_entity.dart';
import 'package:stool_in/features/info/domain/usecase/info_usecase.dart';

part 'doubts_state.dart';

class DoubtsCubit extends Cubit<DoubtsState> {
  final InfoUsecase _infoUsecase;
  final DoubtsCachedDatasource _doubtsCachedDatasource;
  DoubtsCubit({
    required InfoUsecase infoUsecase,
    required DoubtsCachedDatasource doubtsCachedDatasource,
  })  : _infoUsecase = infoUsecase,
        _doubtsCachedDatasource = doubtsCachedDatasource,
        super(DoubtsInitial());
  Future<void> getDoubts() async {
    emit(DoubtsLoading());
    final result = await _infoUsecase.getDoubts();
    final cachedDoubts = await _doubtsCachedDatasource.getCachedData();
    result.fold(
      (error) => emit(DoubtsErro(errorMessage: error.message)),
      (sucess) => emit(
        DoubtsSucess(doubts: sucess),
      ),
    );
  }
}
