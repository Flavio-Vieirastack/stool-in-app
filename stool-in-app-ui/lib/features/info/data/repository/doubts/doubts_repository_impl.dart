
import 'package:stool_in/features/info/domain/error/info_error.dart';
import 'package:stool_in/features/info/domain/entity/info_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/features/info/domain/repository/doubt/doubt_repository.dart';

class DoubtsRepositoryImpl implements DoubtRepository {
  @override
  Future<Either<InfoError, List<InfoEntity>>> getDoubts() {
    // TODO: implement getDoubts
    throw UnimplementedError();
  }
  
}