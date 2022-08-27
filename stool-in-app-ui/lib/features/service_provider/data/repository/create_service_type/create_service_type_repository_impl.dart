import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../export/service_provider_export.dart';


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
