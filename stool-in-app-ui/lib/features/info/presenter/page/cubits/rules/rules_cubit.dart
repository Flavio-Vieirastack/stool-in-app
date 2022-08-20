import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in/features/info/domain/entity/info_entity.dart';
import 'package:stool_in/features/info/domain/usecase/info_usecase.dart';

part 'rules_state.dart';

class RulesCubit extends Cubit<RulesState> {
  final InfoUsecase _infoUsecase;
  RulesCubit({required InfoUsecase infoUsecase})
      : _infoUsecase = infoUsecase,
        super(RulesInitial());

  Future<void> getRules() async {
    final result = await _infoUsecase.getRules();

    result.fold(
      (error) => emit(RulesError(errorMessage: error.message)),
      (sucess) => emit(
        RulesSucess(rules: sucess),
      ),
    );
  }
}
