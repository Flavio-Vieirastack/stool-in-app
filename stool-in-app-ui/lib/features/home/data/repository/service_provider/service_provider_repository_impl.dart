import 'dart:developer';

import '../../../export/home_export.dart';
import 'package:dartz/dartz.dart';



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
