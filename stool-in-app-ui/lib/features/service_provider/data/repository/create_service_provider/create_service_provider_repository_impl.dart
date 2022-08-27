import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../auth/export/auth_exports.dart';
import '../../../export/service_provider_export.dart';


class CreateServiceProviderRepositoryImpl
    implements CreateServiceProviderRepository {
  final CreateServiceProviderDatasource _createServiceProviderDatasource;
  CreateServiceProviderRepositoryImpl({
    required CreateServiceProviderDatasource createServiceProviderDatasource,
  }) : _createServiceProviderDatasource = createServiceProviderDatasource;
  @override
  Future<Either<CreateServiceProviderError, ServiceProviderReturnEntity>>
      createServiceProvider({
    required CreateAndUpdateServiceProviderEntity
        createAndUpdateServiceProviderEntity,
  }) async {
    try {
      final result =
          await _createServiceProviderDatasource.createServiceProvider(
        createAndUpdateServiceProviderModel:
            CreateAndUpdateServiceProviderModel.fromEntity(
          createAndUpdateServiceProviderEntity:
              createAndUpdateServiceProviderEntity,
        ),
      );
      return Right(result);
    } on CreateServiceProviderError catch (e, s) {
      log(
        'Erro ao criar provedor de serviço no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(
        CreateServiceProviderError(
          message: 'Erro ao criar sua conta, tente mais tarde',
        ),
      );
    } catch (e, s) {
      log(
        'Erro ao criar provedor de serviço no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(
        CreateServiceProviderError(
          message: 'Erro no servidor, tente novamente mais tarde',
        ),
      );
    }
  }

  @override
  Future<Either<CreateServiceProviderError, void>>
      sendServiceProviderIdToUserData({
    required UserDataEntity serviceProviderId,
  }) async {
    try {
      final result = await _createServiceProviderDatasource
          .sendServiceProviderIdToUserData(
        userDataModel:
            UserDataModel.fromEntity(userDataEntity: serviceProviderId),
      );
      return Right(result);
    } on CreateServiceProviderError catch (e, s) {
      log(
        'Erro ao atualizar service provider id no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(
        CreateServiceProviderError(
          message: e.message,
        ),
      );
    } catch (e, s) {
      log(
        'Erro desconhecido ao atualoizar service provider id no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(
        CreateServiceProviderError(
          message: 'Erro no servidor, tente novamente mais tarde',
        ),
      );
    }
  }
}
