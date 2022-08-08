import 'dart:developer';

import 'package:stool_in_app_ui/features/home/data/datasource/service_provider_datasource.dart';
import 'package:stool_in_app_ui/features/home/domain/error/service_provider_error.dart';
import 'package:stool_in_app_ui/features/home/domain/entity/service_provider_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in_app_ui/features/home/domain/repository/service_provider_repository.dart';

class ServiceProviderRepositoryImpl implements ServiceProviderRepository {
  final ServiceProviderDatasource _serviceProviderDatasource;
  ServiceProviderRepositoryImpl({
    required ServiceProviderDatasource serviceProviderDatasource,
  }) : _serviceProviderDatasource = serviceProviderDatasource;
  @override
  Future<Either<ServiceProviderError, List<ServiceProviderEntity>>> call({
    required int pageQuantity,
  }) async {
    try {
      final result =
          await _serviceProviderDatasource(pageQuantity: pageQuantity);
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
