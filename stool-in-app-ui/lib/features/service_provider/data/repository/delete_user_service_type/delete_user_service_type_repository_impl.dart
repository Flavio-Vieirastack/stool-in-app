import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../export/service_provider_export.dart';


class DeleteUserServiceTypeRepositoryImpl
    implements DeleteUserServiceTypeRepository {
  final DeleteUserServiceTypeDatasource _deleteUserServiceTypeDatasource;
  DeleteUserServiceTypeRepositoryImpl({
    required DeleteUserServiceTypeDatasource deleteUserServiceTypeDatasource,
  }) : _deleteUserServiceTypeDatasource = deleteUserServiceTypeDatasource;
  @override
  Future<Either<DeleteServiceTypeError, void>> call({required int id}) async {
    try {
      final result =
          await _deleteUserServiceTypeDatasource.deleteUserServiceType(id: id);
      return Right(result);
    } on DeleteServiceTypeError catch (e, s) {
      log(
        'Erro ao deletar service type no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(DeleteServiceTypeError(message: e.message));
    } catch (e, s) {
      log(
        'Erro não mapeado ao deletar service type no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(
        DeleteServiceTypeError(
          message: 'Erro no servidor, tente novamente mais tarde',
        ),
      );
    }
  }
}
