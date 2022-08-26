import 'package:dartz/dartz.dart';
import 'package:stool_in/features/service_provider/domain/error/delete_service_type_error.dart';

abstract class DeleteUserServiceTypeUsecase {
  Future<Either<DeleteServiceTypeError, void>> call({required int id});
}
