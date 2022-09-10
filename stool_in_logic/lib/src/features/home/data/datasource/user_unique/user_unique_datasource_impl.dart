import 'dart:developer';

import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/src/features/home/data/datasource/user_unique/user_unique_datasource.dart';
import 'package:stool_in_logic/src/features/home/data/model/user_unique/user_unique_model.dart';
import 'package:stool_in_logic/src/features/home/domain/entity/user_unique/user_unique_entity.dart';
import 'package:stool_in_logic/src/features/home/domain/error/user_unique/user_unique_error.dart';

class UserUniqueDatasourceImpl implements UserUniqueDatasource {
  final RestClientGet _restClientGet;
  UserUniqueDatasourceImpl({
    required RestClientGet restClientGet,
  }) : _restClientGet = restClientGet;
  @override
  Future<UserUniqueEntity> call() async {
    try {
      final result =
          await _restClientGet.get(path: EndpointConstants.userUnique);
      return UserUniqueModel.fromMap(result.data);
    } on RestClientException catch (e, s) {
      log(
        'Erro ao pegar dados do user data unique no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw UserUniqueError(
        error: 'Erro ao buscar seus dados, tente mais tarde',
      );
    } on UserUniqueError catch (e, s) {
      log(
        'Erro mapeado ao pegar dados do user data unique no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw UserUniqueError(
        error: 'Erro ao buscar seus dados, tente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro não mapeado ao pegar dados do user data unique no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw UserUniqueError(
        error: 'Erro interno ao buscar seus dados, tente mais tarde',
      );
    }
  }
}
