import 'package:dartz/dartz.dart';

import '../../../export/service_provider_export.dart';


abstract class UpdateServiceTypesRepository {
  Future<Either<UpdateServiceTypesError, void>> call({
    required CreateServiceTypesEntity createServiceTypesEntity,
  });
}
