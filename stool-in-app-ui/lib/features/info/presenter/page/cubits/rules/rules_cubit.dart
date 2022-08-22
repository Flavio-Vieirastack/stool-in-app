import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in/core/cache/helpers/cubit_emit_cache_data_helper.dart';
import 'package:stool_in/features/info/data/datasource/rules/cache/rules_cached_datasource.dart';
import 'package:stool_in/features/info/domain/entity/info_entity.dart';
import 'package:stool_in/features/info/domain/usecase/info_usecase.dart';

import '../../../../../../core/cache/helpers/user_actions_helper/cache_user_actions_helper.dart';

part 'rules_state.dart';

class RulesCubit extends Cubit<RulesState> {
  final InfoUsecase _infoUsecase;
  final RulesCachedDatasource _rulesCachedDatasource;
  final CacheUserActionsHelper _cacheUserActionsHelper;
  RulesCubit({
    required RulesCachedDatasource rulesCachedDatasource,
    required CacheUserActionsHelper cacheUserActionsHelper,
    required InfoUsecase infoUsecase,
  })  : _infoUsecase = infoUsecase,
        _cacheUserActionsHelper = cacheUserActionsHelper,
        _rulesCachedDatasource = rulesCachedDatasource,
        super(RulesInitial());

  Future<void> getRules() async {
    emit(RulesLoading());
    final cachedRules = await _rulesCachedDatasource.getCachedData();
    final userMakeApiRequest =
        await _cacheUserActionsHelper.getUserGetRulesData();
    CubitEmitCacheDataHelper.returnCachedDataOrApiData(
      falseCondition: userMakeApiRequest,
      apiEmition: () async {
        final result = await _infoUsecase.getRules();
        result.fold(
          (error) => emit(
            RulesError(errorMessage: error.message),
          ),
          (sucess) => emit(
            RulesSucess(rules: sucess),
          ),
        );
      },
      cacheEmition: () => emit(
        RulesSucess(rules: cachedRules),
      ),
      setConditionToTrue: () async =>
          _cacheUserActionsHelper.setUserGetRulesData(value: true),
    );
  }
}
