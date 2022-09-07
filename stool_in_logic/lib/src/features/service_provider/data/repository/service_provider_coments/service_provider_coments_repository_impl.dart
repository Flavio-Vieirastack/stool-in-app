import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../home/data/model/service_provider/coments_model.dart';
import '../../../../home/domain/entity/service_provider/coments_entity.dart';
import '../../../domain/error/coments_error.dart';
import '../../../domain/repository/service_provider_coments/service_provider_coments_repository.dart';
import '../../datasource/service_provider_coments/service_provider_coments_datasource.dart';



class ServiceProviderComentsRepositoryImpl
    implements ServiceProviderComentsRepository {
  final ServiceProviderComentsDatasource _serviceProviderComentsDatasource;
  final String errorMessage = 'Erro interno, por favor tente mais tarde';
  ServiceProviderComentsRepositoryImpl({
    required ServiceProviderComentsDatasource serviceProviderComentsDatasource,
  }) : _serviceProviderComentsDatasource = serviceProviderComentsDatasource;
  @override
  Future<Either<ComentsError, void>> createComent({
    required ComentsEntity comentsEntity,
    required int serviceProviderId,
  }) async {
    try {
      final result = await _serviceProviderComentsDatasource.createComent(
        comentsModel: ComentsModel.fromEntity(comentsEntity: comentsEntity),
        serviceProviderId: serviceProviderId,
      );
      return Right(result);
    } on ComentsError catch (e, s) {
      log(
        'Erro ao fazer post dos comentarios no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(ComentsError(message: e.message));
    } catch (e, s) {
      log(
        'Erro não mapeado ao fazer post dos comentarios no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(
        ComentsError(
          message: errorMessage,
        ),
      );
    }
  }

  @override
  Future<Either<ComentsError, void>> deleteComent({
    required int comentId,
  }) async {
    try {
      final result = await _serviceProviderComentsDatasource.deleteComent(
          comentId: comentId);
      return Right(result);
    } on ComentsError catch (e, s) {
      log(
        'Erro ao deletar um comentario no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(ComentsError(message: e.message));
    } catch (e, s) {
      log(
        'Erro não mapeado ao deletar um comentario no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(ComentsError(message: errorMessage));
    }
  }

  @override
  Future<Either<ComentsError, List<ComentsEntity>>> getAllMyComents() async {
    try {
      final result = await _serviceProviderComentsDatasource.getAllMyComents();
      return Right(result);
    } on ComentsError catch (e, s) {
      log(
        'Erro ao fazer get all dos comentario no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(ComentsError(message: e.message));
    } catch (e, s) {
      log(
        'Erro não mapeado ao fazer get all dos comentario no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(ComentsError(message: errorMessage));
    }
  }

  @override
  Future<Either<ComentsError, ComentsEntity>> getUniqueComent({
    required int comentId,
  }) async {
    try {
      final result = await _serviceProviderComentsDatasource.getUniqueComent(
          comentId: comentId);
      return Right(result);
    } on ComentsError catch (e, s) {
      log(
        'Erro ao fazer get unique dos comentario no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(ComentsError(message: e.message));
    } catch (e, s) {
      log(
        'Erro não mapeado fazer get unique dos comentario no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(ComentsError(message: errorMessage));
    }
  }

  @override
  Future<Either<ComentsError, void>> updateComent({
    required ComentsEntity comentsEntity,
    required int serviceProviderId,
  }) async {
    try {
      final result = await _serviceProviderComentsDatasource.updateComent(
        comentsModel: ComentsModel.fromEntity(comentsEntity: comentsEntity),
        serviceProviderId: serviceProviderId,
      );
      return Right(result);
    } on ComentsError catch (e, s) {
      log(
        'Erro ao fazer update dos comentario no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(ComentsError(message: e.message));
    } catch (e, s) {
      log(
        'Erro não mapeado fazer update dos comentario no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(ComentsError(message: errorMessage));
    }
  }
}
