import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../home/domain/entity/service_provider/service_provider_entity.dart';
import '../../../domain/error/get_service_provider_unique_error.dart';
import '../../../domain/repository/get_service_provider_unique/get_service_provider_unique_repository.dart';
import '../../datasource/get_service_provider_unique/get_service_provider_unique_datasource.dart';

class GetServiceProviderUniqueRepositoryImpl
    implements GetServiceProviderUniqueRepository {
  final GetServiceProviderUniqueDatasource _getServiceProviderUniqueDatasource;
  GetServiceProviderUniqueRepositoryImpl({
    required GetServiceProviderUniqueDatasource
        getServiceProviderUniqueDatasource,
  }) : _getServiceProviderUniqueDatasource = getServiceProviderUniqueDatasource;
  @override
  Future<Either<GetServiceProviderUniqueError, ServiceProviderEntity>> call({
    required int serviceProviderId,
  }) async {
    try {
      final result = await _getServiceProviderUniqueDatasource
          .getServiceProviderUnique(serviceProviderId: serviceProviderId);
      return Right(result);
    } on GetServiceProviderUniqueError catch (e, s) {
      log(
        'Erro ao fazer get do service provider unique',
        error: e,
        stackTrace: s,
      );
      return Left(GetServiceProviderUniqueError(message: e.message));
    } catch (e, s) {
      log(
        'Erro não mapeado ao fazer get do service provider unique',
        error: e,
        stackTrace: s,
      );
      return Left(
        GetServiceProviderUniqueError(
          message:
              'Erro interno ao buscar dados dos provedores de serviço, tente mais tarde',
        ),
      );
    }
  }
}
