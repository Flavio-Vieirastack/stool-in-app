import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../home/export/home_export.dart';
import '../../../export/service_provider_export.dart';


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
