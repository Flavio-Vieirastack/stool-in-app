import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in/core/cache/helpers/cubit_emit_cache_data_helper.dart';

void main() {
  test('Deve fazer retornar o api emition como true', () async {
    const falseCondition = false;
    bool apiEmition = false;
    CubitEmitCacheDataHelper.returnCachedDataOrApiData(
      falseCondition: falseCondition,
      apiEmition: () async {
        apiEmition = true;
      },
      cacheEmition: () {},
      setConditionToTrue: () async {},
    );
    expect(apiEmition, true);
  });
  test('Deve fazer retornar o cacheEmition como true', () async {
    const falseCondition = true;
    bool cacheEmition = false;
    await CubitEmitCacheDataHelper.returnCachedDataOrApiData(
      falseCondition: falseCondition,
      apiEmition: () async {
      },
      cacheEmition: () {
        cacheEmition = true;
      },
      setConditionToTrue: () async {
      },
    );
    expect(cacheEmition, true);
  });
  test('Deve fazer retornar o setConditionToTrue como true', () async {
    const falseCondition = false;
    bool setConditionToTrue = false;
    await CubitEmitCacheDataHelper.returnCachedDataOrApiData(
      falseCondition: falseCondition,
      apiEmition: () async {
      },
      cacheEmition: () {
      },
      setConditionToTrue: () async {
        setConditionToTrue = true;
      },
    );
    expect(setConditionToTrue, true);
  });
}
