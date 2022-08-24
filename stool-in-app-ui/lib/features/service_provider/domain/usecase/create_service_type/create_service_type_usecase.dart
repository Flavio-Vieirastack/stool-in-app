import 'package:dartz/dartz.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/service_types_return_entity.dart';
import 'package:stool_in/features/service_provider/domain/error/create_service_type_error.dart';

import '../../entity/service_types/create_service_types_entity.dart';

abstract class CreateServiceTypeUsecase {
  Future<Either<CreateServiceTypeError, ServiceTypesReturnEntity>> call({required CreateServiceTypesEntity createServiceTypesEntity});
}
