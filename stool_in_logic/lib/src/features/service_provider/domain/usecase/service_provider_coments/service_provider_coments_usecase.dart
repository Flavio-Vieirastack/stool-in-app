import 'package:dartz/dartz.dart';

import '../../../../home/domain/entity/service_provider/coments_entity.dart';
import '../../error/coments_error.dart';

abstract class ServiceProviderComentsUsecase {
   Future<Either<ComentsError, void>> createComent({
    required ComentsEntity comentsEntity,
    required int serviceProviderId,
  });
  Future<Either<ComentsError, void>> updateComent({
    required ComentsEntity comentsEntity,
    required int serviceProviderId,
  });
  Future<Either<ComentsError, List<ComentsEntity>>> getAllMyComents();
  Future<Either<ComentsError, ComentsEntity>> getUniqueComent({
    required int comentId,
  });
  Future<Either<ComentsError, void>> deleteComent({
    required int comentId,
  });
}