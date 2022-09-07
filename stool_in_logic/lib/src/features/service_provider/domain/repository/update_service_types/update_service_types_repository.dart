import 'package:dartz/dartz.dart';

import '../../../../../../exports/app_exports.dart';


abstract class UpdateServiceTypesRepository {
  Future<Either<UpdateServiceTypesError, void>> call({
    required CreateServiceTypesEntity createServiceTypesEntity,
  });
}
