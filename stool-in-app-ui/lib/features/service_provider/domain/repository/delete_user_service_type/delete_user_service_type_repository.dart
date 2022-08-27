import 'package:dartz/dartz.dart';

import '../../../export/service_provider_export.dart';


abstract class DeleteUserServiceTypeRepository {
  Future<Either<DeleteServiceTypeError, void>> call({required int id});
}
