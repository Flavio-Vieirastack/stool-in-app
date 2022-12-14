import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../home/domain/error/service_provider/service_provider_error.dart';
import '../../../domain/entity/service_provider/create_and_update_service_provider_entity.dart';
import '../../../domain/repository/update_service_provider_repository/update_service_provider_repository.dart';
import '../../datasource/update_service_provider/update_service_provider_datasource.dart';
import '../../model/service_provider/create_and_update_service_provider_model.dart';



class UpdateServiceProviderRepositoryImpl
    implements UpdateServiceProviderRepository {
  final UpdateServiceProviderDatasource _updateServiceProviderDatasource;
  UpdateServiceProviderRepositoryImpl({
    required UpdateServiceProviderDatasource updateServiceProviderDatasource,
  }) : _updateServiceProviderDatasource = updateServiceProviderDatasource;
  @override
  Future<Either<ServiceProviderError, void>> call({
    required CreateAndUpdateServiceProviderEntity
        createAndUpdateServiceProviderEntity,
  }) async {
    try {
      final result = await _updateServiceProviderDatasource(
        createAndUpdateServiceProviderModel:
            CreateAndUpdateServiceProviderModel.fromEntity(
          createAndUpdateServiceProviderEntity:
              createAndUpdateServiceProviderEntity,
        ),
      );
      return Right(result);
    } on ServiceProviderError catch (e, s) {
      log(
        'Erro ao fazer update do service provider no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(ServiceProviderError(message: e.message));
    } catch (e, s) {
      log(
        'Erro ao fazer update do service provider no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(
          ServiceProviderError(message: 'Erro no servidor, tente mais tarde'));
    }
  }
}
