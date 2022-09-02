import 'package:dartz/dartz.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/coments_entity.dart';
import 'package:stool_in/features/service_provider/domain/error/coments_error.dart';

abstract class ServiceProviderComentsRepository {
  Future<Either<ComentsError, void>> createComent({
    required ComentsEntity comentsEntity,
    required int serviceProviderId,
  });
  Future<Either<ComentsError, void>> updateComent({
    required ComentsEntity comentsEntity,
    int serviceProviderId,
  });
  Future<Either<ComentsError, List<ComentsEntity>>> getAllMyComents();
  Future<Either<ComentsError, ComentsEntity>> getUniqueComent({
    required int comentId,
  });
  Future<Either<ComentsError, void>> deleteComent({
    required int comentId,
  });
}
