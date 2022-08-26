import 'package:dartz/dartz.dart';

import '../../error/delete_service_type_error.dart';

abstract class DeleteUserServiceTypeRepository {
  Future<Either<DeleteServiceTypeError, void>> call({required int id});
}
