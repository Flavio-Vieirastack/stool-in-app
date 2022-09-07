import 'package:dartz/dartz.dart';

import '../../../../../exports/app_exports.dart';

abstract class DeleteUserServiceTypeUsecase {
  Future<Either<DeleteServiceTypeError, void>> call({required int id});
}
