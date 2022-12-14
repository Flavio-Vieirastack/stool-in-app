
import 'package:dartz/dartz.dart';

import '../../error/delete_service_type_error.dart';
import '../../repository/delete_user_service_type/delete_user_service_type_repository.dart';
import 'delete_user_service_type_usecase.dart';




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
