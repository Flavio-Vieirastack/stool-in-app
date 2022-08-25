import 'dart:developer';

import 'package:stool_in/features/service_provider/data/datasource/update_service_types/update_service_type_datasource.dart';
import 'package:stool_in/features/service_provider/data/model/service_type/create_service_type_model.dart';
import 'package:stool_in/features/service_provider/domain/error/update_service_types_error.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/create_service_types_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/features/service_provider/domain/repository/update_service_types/update_service_types_repository.dart';

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
      final result = await _updateServiceTypeDatasource.call(
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
