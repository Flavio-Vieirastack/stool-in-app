import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../../../exports/app_exports.dart';



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
