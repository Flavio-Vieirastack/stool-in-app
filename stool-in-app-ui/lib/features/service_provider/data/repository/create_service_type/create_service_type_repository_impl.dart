import 'dart:developer';

import 'package:stool_in/features/service_provider/data/datasource/create_service_type/create_service_type_datasource.dart';
import 'package:stool_in/features/service_provider/data/model/service_type/create_service_type_model.dart';
import 'package:stool_in/features/service_provider/domain/error/create_service_type_error.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/service_types_return_entity.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/create_service_types_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/features/service_provider/domain/repository/create_service_type/create_service_type_repository.dart';

class CreateServiceTypeRepositoryImpl implements CreateServiceTypeRepository {
  final CreateServiceTypeDatasource _createServiceTypeDatasource;
  CreateServiceTypeRepositoryImpl({
    required CreateServiceTypeDatasource createServiceTypeDatasource,
  }) : _createServiceTypeDatasource = createServiceTypeDatasource;
  @override
  Future<Either<CreateServiceTypeError, ServiceTypesReturnEntity>> call({
    required CreateServiceTypesEntity createServiceTypesEntity,
  }) async {
    try {
      final result = await _createServiceTypeDatasource(
        createServiceTypeModel: CreateServiceTypeModel.fromEntity(
          createServiceTypesEntity: createServiceTypesEntity,
        ),
      );
      return Right(result);
    } on CreateServiceTypeError catch (e, s) {
      log('Erro ao criar service type no repository impl',
          error: e, stackTrace: s);
      return Left(
        CreateServiceTypeError(
            message: e.message),
      );
    } catch (e, s) {
      log(
        'Erro ao criar service type no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(
        CreateServiceTypeError(
            message: 'Erro no servidor ao criar serviço, tente mais tarde'),
      );
    }
  }
}
