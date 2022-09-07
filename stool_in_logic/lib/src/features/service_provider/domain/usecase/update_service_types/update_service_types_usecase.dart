import 'package:dartz/dartz.dart';

import '../../entity/service_types/create_service_types_entity.dart';
import '../../error/update_service_types_error.dart';

abstract class UpdateServiceTypesUsecase {
  Future<Either<UpdateServiceTypesError, void>> call({required CreateServiceTypesEntity createServiceTypesEntity});
}
