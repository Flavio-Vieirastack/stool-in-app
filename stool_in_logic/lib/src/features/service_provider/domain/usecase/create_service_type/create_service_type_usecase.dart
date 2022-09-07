import 'package:dartz/dartz.dart';

import '../../entity/service_types/create_service_types_entity.dart';
import '../../entity/service_types/service_types_return_entity.dart';
import '../../error/create_service_type_error.dart';




abstract class CreateServiceTypeUsecase {
  Future<Either<CreateServiceTypeError, ServiceTypesReturnEntity>> call({required CreateServiceTypesEntity createServiceTypesEntity});
}
