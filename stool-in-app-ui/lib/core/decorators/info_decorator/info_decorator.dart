import 'package:stool_in/features/info/domain/error/info_error.dart';
import 'package:stool_in/features/info/domain/entity/info_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/features/info/domain/usecase/info_usecase.dart';

class InfoDecorator implements InfoUsecase {
  final InfoUsecase _infoUsecase;
  InfoDecorator({
    required InfoUsecase infoUsecase,
  }) : _infoUsecase = infoUsecase;
  @override
  Future<Either<InfoError, List<InfoEntity>>> getDoubts() async {
    return await _infoUsecase.getDoubts();
  }

  @override
  Future<Either<InfoError, List<InfoEntity>>> getRules() async {
    return await _infoUsecase.getRules();
  }
}
