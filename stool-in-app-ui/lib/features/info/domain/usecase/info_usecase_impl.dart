import 'package:dartz/dartz.dart';

import '../../export/info_export.dart';


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
