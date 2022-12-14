import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../home/data/model/service_provider/services_to_execute_model.dart';
import '../../../../home/domain/entity/service_provider/services_to_execute_entity.dart';
import '../../../domain/error/services_to_execute_error.dart';
import '../../../domain/repository/services_to_execute/services_to_execute_repository.dart';
import '../../datasource/services_to_execute/services_to_execute_datasource.dart';

class ServicesToExecuteRepositoryImpl implements ServicesToExecuteRepository {
  final ServicesToExecuteDatasource _servicesToExecuteDatasource;
  final errorMessage = 'Erro no servidor, tente mais tarde';

  ServicesToExecuteRepositoryImpl({
    required ServicesToExecuteDatasource servicesToExecuteDatasource,
  }) : _servicesToExecuteDatasource = servicesToExecuteDatasource;
  @override
  Future<Either<ServicesToExecuteError, void>> createServiceToExecute({
    required ServicesToExecuteEntity servicesToExecuteEntity,
    required int serviceProviderId,
  }) async {
    try {
      final result = await _servicesToExecuteDatasource.createServiceToExecute(
        servicesToExecuteModel: ServicesToExecuteModel.fromEntity(
          servicesToExecuteEntity: servicesToExecuteEntity,
        ),
        serviceProviderId: serviceProviderId,
      );
      return Right(result);
    } on ServicesToExecuteError catch (e, s) {
      log(
        'Erro ao criar service to execute no repository impl',
        error: s,
        stackTrace: s,
      );
      return Left(ServicesToExecuteError(message: e.message));
    } catch (e, s) {
      log(
        'Erro não mapeado ao criar service to execute no repository impl',
        error: s,
        stackTrace: s,
      );
      return Left(
        ServicesToExecuteError(message: errorMessage),
      );
    }
  }

  @override
  Future<Either<ServicesToExecuteError, void>> deleteServiceToExecute({
    required int serviceToExecuteid,
  }) async {
    try {
      final result = await _servicesToExecuteDatasource.deleteServiceToExecute(
          serviceToExecuteid: serviceToExecuteid);
      return Right(result);
    } on ServicesToExecuteError catch (e, s) {
      log(
        'Erro ao deletar service to execute no repository impl',
        error: s,
        stackTrace: s,
      );
      return Left(
        ServicesToExecuteError(
          message: e.message,
        ),
      );
    } catch (e, s) {
      log(
        'Erro não mapeado ao deletar service to execute no repository impl',
        error: s,
        stackTrace: s,
      );
      return Left(
        ServicesToExecuteError(
          message: errorMessage,
        ),
      );
    }
  }

  @override
  Future<Either<ServicesToExecuteError, List<ServicesToExecuteEntity>>>
      getAllServicesToExecute() async {
    try {
      final result =
          await _servicesToExecuteDatasource.getAllServicesToExecute();
      return Right(result);
    } on ServicesToExecuteError catch (e, s) {
      log(
        'Erro ao pegar todos os service to execute no repository impl',
        error: s,
        stackTrace: s,
      );
      return Left(
        ServicesToExecuteError(
          message: e.message,
        ),
      );
    } catch (e, s) {
      log(
        'Erro não mapeado ao pegar todos os service to execute no repository impl',
        error: s,
        stackTrace: s,
      );
      return Left(
        ServicesToExecuteError(
          message: errorMessage,
        ),
      );
    }
  }

  @override
  Future<Either<ServicesToExecuteError, ServicesToExecuteEntity>>
      getServicesToExecuteUnique({
    required int serviceToExecuteId,
  }) async {
    try {
      final result = await _servicesToExecuteDatasource
          .getServicesToExecuteUnique(serviceToExecuteId: serviceToExecuteId);
      return Right(result);
    } on ServicesToExecuteError catch (e, s) {
      log(
        'Erro ao pegar os service to execute unique no repository impl',
        error: s,
        stackTrace: s,
      );
      return Left(
        ServicesToExecuteError(
          message: e.message,
        ),
      );
    } catch (e, s) {
      log(
        'Erro não mapeado ao pegar service to execute unique no repository impl',
        error: s,
        stackTrace: s,
      );
      return Left(
        ServicesToExecuteError(
          message: errorMessage,
        ),
      );
    }
  }

  @override
  Future<Either<ServicesToExecuteError, void>> updateServicesToExecute({
    required ServicesToExecuteEntity servicesToExecuteEntity,
    required int serviceToExecuteId,
  }) async {
    try {
      final result = await _servicesToExecuteDatasource.updateServicesToExecute(
        serviceToExecuteId: serviceToExecuteId,
        servicesToExecuteModel: ServicesToExecuteModel.fromEntity(
          servicesToExecuteEntity: servicesToExecuteEntity,
        ),
      );
      return Right(result);
    } on ServicesToExecuteError catch (e, s) {
      log(
        'Erro ao fazer update dos service to execute unique no repository impl',
        error: s,
        stackTrace: s,
      );
      return Left(
        ServicesToExecuteError(
          message: e.message,
        ),
      );
    } catch (e, s) {
      log(
        'Erro não mapeado ao fazer update dos service to execute unique no repository impl',
        error: s,
        stackTrace: s,
      );
      return Left(
        ServicesToExecuteError(
          message: errorMessage,
        ),
      );
    }
  }
}
