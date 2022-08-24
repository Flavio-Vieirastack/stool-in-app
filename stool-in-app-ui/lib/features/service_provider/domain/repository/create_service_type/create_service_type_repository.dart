import 'package:dartz/dartz.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/create_service_types_entity.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/service_types_return_entity.dart';

import '../../error/create_service_type_error.dart';

abstract class CreateServiceTypeRepository {
  Future<Either<CreateServiceTypeError, ServiceTypesReturnEntity>> call({required CreateServiceTypesEntity createServiceTypesEntity});
}