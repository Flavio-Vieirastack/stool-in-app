import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:stool_in/core/decorators/decorator_keys/decorator_keys.dart';
import 'package:stool_in/core/decorators/info_decorator/info_decorator.dart';
import 'package:stool_in/core/decorators/interface/decorator.dart';
import 'package:stool_in/core/helpers/shared_preferences/shared_preferences_helper.dart';
import 'package:stool_in/features/info/data/model/info_model.dart';

import '../../../features/info/domain/entity/info_entity.dart';
import '../../../features/info/domain/error/info_error.dart';

class InfoCacheDecorator extends InfoDecorator
    with SharedPreferencesHelper, DecoratorKeys
    implements Decorator<List<InfoEntity>> {
  InfoCacheDecorator({
    required super.infoUsecase,
  });
  @override
  Future<Either<InfoError, List<InfoEntity>>> getDoubts() async {
    log('Doubts cache completed', name: 'Cache');
    final result = await super.getDoubts();
    result.fold(
      (l) => log('Erro ao salvar no cache', name: 'Cache'),
      (r) => saveInCache(entity: r),
    );
    return result;
  }

  @override
  Future<Either<InfoError, List<InfoEntity>>> getRules() async {
    log('Rules cache completed', name: 'Cache');
    return await super.getRules();
  }

  @override
  Future<List<InfoEntity>> getInCache() async {
    final doubtsString = await getString(key: doubtsDecoratorKey);
    final decodedData = jsonDecode(doubtsString!);
    final result = decodedData.map((e) => InfoModel.fromMap(e)).toList();
    log('result encoded data $result', name: 'Cache');
    return result;
  }

  @override
  Future<void> saveInCache({required List<InfoEntity> entity}) async {
    String? encodedData;
    for (var entity in entity) {
      encodedData = jsonEncode(
        InfoModel(id: entity.id, title: entity.title, body: entity.body)
            .toMap(),
      );
    }
    log('Encoded doubts $encodedData', name: 'Cache');
    await saveString(
      key: doubtsDecoratorKey,
      value: encodedData ?? 'Sem dados',
    );
  }
}
