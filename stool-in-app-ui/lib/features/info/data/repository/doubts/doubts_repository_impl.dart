import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../export/info_export.dart';

class DoubtsRepositoryImpl implements DoubtRepository {
  final DoubtsDatasource _doubtsDatasource;
  DoubtsRepositoryImpl({
    required DoubtsDatasource doubtsDatasource,
  }) : _doubtsDatasource = doubtsDatasource;
  @override
  Future<Either<InfoError, List<InfoEntity>>> getDoubts() async {
    try {
      final result = await _doubtsDatasource.getDoubts();
      return Right(result);
    } on InfoError catch (e, s) {
      log('Erro ao buscar duvidas no repository impl', error: e, stackTrace: s);
      return Left(InfoError(message: e.message));
    } catch (e, s) {
      log('Erro desconhecido no rules repository', error: e, stackTrace: s);
      return Left(InfoError(
          message: 'Erro ao buscar dados de dúvidas, tente mais tarde'));
    }
  }
}
