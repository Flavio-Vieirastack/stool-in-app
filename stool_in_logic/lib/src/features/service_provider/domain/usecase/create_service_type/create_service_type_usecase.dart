import 'package:dartz/dartz.dart';

import '../../../../../exports/app_exports.dart';



abstract class CreateServiceTypeUsecase {
  Future<Either<CreateServiceTypeError, ServiceTypesReturnEntity>> call({required CreateServiceTypesEntity createServiceTypesEntity});
}
