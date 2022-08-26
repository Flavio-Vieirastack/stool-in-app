import 'dart:developer';

import 'package:stool_in/features/service_provider/data/datasource/get_user_service_types/get_user_service_types_datasource.dart';
import 'package:stool_in/features/service_provider/domain/error/get_user_service_types_error.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/service_types_return_entity.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/create_service_types_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/features/service_provider/domain/repository/get_user_service_types/get_user_service_types_repository.dart';

class GetUserServiceTypesRepositoryImpl
    implements GetUserServiceTypesRepository {
  final GetUserServiceTypesDatasource _getUserServiceTypesDatasource;
  GetUserServiceTypesRepositoryImpl({
    required GetUserServiceTypesDatasource getUserServiceTypesDatasource,
  }) : _getUserServiceTypesDatasource = getUserServiceTypesDatasource;
  @override
  Future<Either<GetUserServiceTypesError, List<ServiceTypesReturnEntity>>>
      call({
    required CreateServiceTypesEntity serviceProviderId,
  }) async {
    try {
      final result = await _getUserServiceTypesDatasource.getUserServicesTypes(
          serviceProviderId: serviceProviderId);
      return Right(result);
    } on GetUserServiceTypesError catch (e, s) {
      log(
        'Erro ao pegar services types do usuario no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(GetUserServiceTypesError(message: e.message));
    } catch (e, s) {
      log(
        'Erro desconhecido ao pegar dados do usuario no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(
        GetUserServiceTypesError(message: 'Erro no servidor, tente mais tarde'),
      );
    }
  }
}
