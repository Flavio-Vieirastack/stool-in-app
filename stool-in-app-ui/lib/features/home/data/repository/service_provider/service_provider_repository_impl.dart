import 'dart:developer';

import 'package:stool_in/features/home/data/datasource/service_provider/service_provider_datasource.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/get_service_providers_params.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/service_provider_entity.dart';
import 'package:stool_in/features/home/domain/error/service_provider/service_provider_error.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/features/home/domain/repository/service_provider/service_provider_repository.dart';


class GetServiceProviderRepositoryImpl implements GetServiceProviderRepository {
  final GetServiceProviderDatasource _serviceProviderDatasource;
  GetServiceProviderRepositoryImpl({
    required GetServiceProviderDatasource serviceProviderDatasource,
  }) : _serviceProviderDatasource = serviceProviderDatasource;
  @override
  Future<Either<ServiceProviderError, List<ServiceProviderEntity>>> call({
    required GetServiceProvidersParams providersParams,
  }) async {
    try {
      final result =
          await _serviceProviderDatasource(providersParams: providersParams);
      return Right(result);
    } on ServiceProviderError catch (e, s) {
      log('Erro ao pegar dados do prestador de serviço no repository',
          error: e, stackTrace: s);
      return Left(ServiceProviderError(message: e.message));
    } catch (e, s) {
      log(
        'Erro desconhecido ao pegar dados do prestador de serviço no repository',
        error: e,
        stackTrace: s,
      );
      return Left(
        ServiceProviderError(message: 'Erro interno, tente mais tarde'),
      );
    }
  }
}
