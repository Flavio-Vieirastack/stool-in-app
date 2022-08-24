import 'dart:developer';

import 'package:stool_in/features/auth/data/model/user_data_model.dart';
import 'package:stool_in/features/service_provider/data/datasource/create_service_provider/create_service_provider_datasource.dart';
import 'package:stool_in/features/service_provider/domain/error/create_service_provider_error.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_provider/service_provider_return_entity.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_provider/create_and_update_service_provider_entity.dart';
import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/features/service_provider/domain/repository/create_service_provider/create_service_provider_repository.dart';

import '../../model/service_provider/create_and_update_service_provider_model.dart';

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
