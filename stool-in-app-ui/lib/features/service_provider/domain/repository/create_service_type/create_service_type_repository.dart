import 'package:dartz/dartz.dart';

import '../../../export/service_provider_export.dart';


abstract class CreateServiceTypeRepository {
  Future<Either<CreateServiceTypeError, ServiceTypesReturnEntity>> call({required CreateServiceTypesEntity createServiceTypesEntity});
}