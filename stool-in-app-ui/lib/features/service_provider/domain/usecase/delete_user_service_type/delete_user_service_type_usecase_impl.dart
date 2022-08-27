
import 'package:dartz/dartz.dart';

import '../../../export/service_provider_export.dart';


class DeleteUserServiceTypeUsecaseImpl implements DeleteUserServiceTypeUsecase {
  final DeleteUserServiceTypeRepository _deleteUserServiceTypeRepository;
  DeleteUserServiceTypeUsecaseImpl({
    required DeleteUserServiceTypeRepository deleteUserServiceTypeRepository,
  }) : _deleteUserServiceTypeRepository = deleteUserServiceTypeRepository;
  @override
  Future<Either<DeleteServiceTypeError, void>> call({required int id}) async {
    return await _deleteUserServiceTypeRepository(id: id);
  }
}
