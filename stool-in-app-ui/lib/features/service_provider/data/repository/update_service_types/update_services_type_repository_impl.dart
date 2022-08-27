import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../../../exports/app_exports.dart';


class UpdateServicesTypeRepositoryImpl implements UpdateServiceTypesRepository {
  final UpdateServiceTypeDatasource _updateServiceTypeDatasource;
  UpdateServicesTypeRepositoryImpl({
    required UpdateServiceTypeDatasource updateServiceTypeDatasource,
  }) : _updateServiceTypeDatasource = updateServiceTypeDatasource;
  @override
  Future<Either<UpdateServiceTypesError, void>> call({
    required CreateServiceTypesEntity createServiceTypesEntity,
  }) async {
    try {
      final result = await _updateServiceTypeDatasource(
          createServiceTypeModel: CreateServiceTypeModel.fromEntity(
              createServiceTypesEntity: createServiceTypesEntity));
      return Right(result);
    } on UpdateServiceTypesError catch (e, s) {
      log('Erro ao fazer update do service types no repository impl',
          error: e, stackTrace: s);
      return Left(UpdateServiceTypesError(message: e.message));
    } catch (e, s) {
      log('Erro desconhecido ao fazer update do service types no repository impl',
          error: e, stackTrace: s);
      return Left(
        UpdateServiceTypesError(
            message: 'Ocorreu um erro no servidor, tente mais tarde'),
      );
    }
  }
}
