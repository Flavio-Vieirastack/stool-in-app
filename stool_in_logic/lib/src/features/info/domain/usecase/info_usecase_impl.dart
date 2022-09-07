import 'package:dartz/dartz.dart';
import 'package:stool_in_logic/src/features/info/domain/usecase/info_usecase.dart';

import '../entity/info_entity.dart';
import '../error/info_error.dart';
import '../repository/doubt/doubt_repository.dart';
import '../repository/rules/rules_repository.dart';



class InfoUsecaseImpl implements InfoUsecase {
  final RulesRepository _rulesRepository;
  final DoubtRepository _doubtRepository;
  InfoUsecaseImpl(
      {required RulesRepository rulesRepository,
      required DoubtRepository doubtRepository})
      : _doubtRepository = doubtRepository,
        _rulesRepository = rulesRepository;
  @override
  Future<Either<InfoError, List<InfoEntity>>> getDoubts() async {
    return await _doubtRepository.getDoubts();
  }

  @override
  Future<Either<InfoError, List<InfoEntity>>> getRules() async {
    return await _rulesRepository.getRules();
  }
}
