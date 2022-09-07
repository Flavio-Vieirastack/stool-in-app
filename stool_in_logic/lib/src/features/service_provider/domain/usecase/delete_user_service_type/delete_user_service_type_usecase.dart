import 'package:dartz/dartz.dart';

import '../../error/delete_service_type_error.dart';


abstract class DeleteUserServiceTypeUsecase {
  Future<Either<DeleteServiceTypeError, void>> call({required int id});
}
