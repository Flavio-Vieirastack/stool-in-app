import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in/features/info/domain/entity/info_entity.dart';
import 'package:stool_in/features/info/domain/usecase/info_usecase.dart';

part 'doubts_state.dart';

class DoubtsCubit extends Cubit<DoubtsState> {
  final InfoUsecase _infoUsecase;
  DoubtsCubit({
    required InfoUsecase infoUsecase,
  })  : _infoUsecase = infoUsecase,
        super(DoubtsInitial());
  Future<void> getDoubts() async {
    emit(DoubtsLoading());
    final result = await _infoUsecase.getDoubts();
    result.fold(
      (error) => emit(DoubtsErro(errorMessage: error.message)),
      (sucess) => emit(
        DoubtsSucess(doubts: sucess),
      ),
    );
  }
}
