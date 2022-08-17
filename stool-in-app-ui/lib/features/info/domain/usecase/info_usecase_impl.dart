import 'package:stool_in/features/info/domain/entity/info_entity.dart';
import 'package:stool_in/features/info/domain/error/info_error.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/features/info/domain/repository/doubt/doubt_repository.dart';
import 'package:stool_in/features/info/domain/repository/rules/rules_repository.dart';
import 'package:stool_in/features/info/domain/usecase/info_usecase.dart';

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
