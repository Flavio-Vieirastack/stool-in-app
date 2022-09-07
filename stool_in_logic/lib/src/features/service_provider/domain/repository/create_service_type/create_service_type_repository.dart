import 'package:dartz/dartz.dart';

import '../../../../../../exports/app_exports.dart';


abstract class CreateServiceTypeRepository {
  Future<Either<CreateServiceTypeError, ServiceTypesReturnEntity>> call({required CreateServiceTypesEntity createServiceTypesEntity});
}