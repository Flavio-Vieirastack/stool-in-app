import 'package:dartz/dartz.dart';

import '../../../export/service_provider_export.dart';


abstract class CreateServiceTypeUsecase {
  Future<Either<CreateServiceTypeError, ServiceTypesReturnEntity>> call({required CreateServiceTypesEntity createServiceTypesEntity});
}
