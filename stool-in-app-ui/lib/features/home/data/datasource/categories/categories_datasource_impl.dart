import 'dart:developer';

import 'package:stool_in/core/constants/endpoint_constants.dart';
import 'package:stool_in/core/rest_client/error/rest_client_exception.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/features/home/data/datasource/categories/categories_datasource.dart';
import 'package:stool_in/features/home/data/model/categories/categories_model.dart';
import 'package:stool_in/features/home/domain/entity/categories/categories_entity.dart';
import 'package:stool_in/features/home/domain/error/categories/categories_error.dart';

class CategoriesDatasourceImpl implements CategoriesDatasource {
  final RestClientGet _restClientGet;
  CategoriesDatasourceImpl({
    required RestClientGet restClientGet,
  }) : _restClientGet = restClientGet;
  @override
  Future<List<CategoriesEntity>> call() async {
    try {
      final result =
          await _restClientGet.get(path: EndpointConstants.getCategories);
      final data = result.data
          .map<CategoriesModel>(
            (model) => CategoriesModel.fromMap(model),
          )
          .toList();
      return data ?? <CategoriesEntity>[];
    } on RestClientException catch (e, s) {
      log('Erro ao pegar categorias no datasource impl',
          error: e, stackTrace: s);
      throw CategoriesError(
        message: 'Erro ao buscar categorias, tente mais tarde',
      );
    } on CategoriesError catch (e, s) {
      log('Erro ao pegar categorias no datasource impl',
          error: e, stackTrace: s);
      throw CategoriesError(
        message: 'Erro no servidor ao buscar categorias, tente mais tarde',
      );
    }
  }
}
