import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/exports/app_exports.dart';


class _UpdateServiceProviderDatasourceMock extends Mock
    implements UpdateServiceProviderDatasource {}

class _CreateAndUpdateServiceProviderEntityMock extends Mock
    implements CreateAndUpdateServiceProviderEntity {}

void main() {
  late _UpdateServiceProviderDatasourceMock updateServiceProviderDatasourceMock;
  late UpdateServiceProviderRepository updateServiceProviderRepository;
  late _CreateAndUpdateServiceProviderEntityMock
      createAndUpdateServiceProviderEntityMock;

  setUpAll(() {
    updateServiceProviderDatasourceMock = _UpdateServiceProviderDatasourceMock();
    updateServiceProviderRepository = UpdateServiceProviderRepositoryImpl(
        updateServiceProviderDatasource: updateServiceProviderDatasourceMock);
    createAndUpdateServiceProviderEntityMock =
        _CreateAndUpdateServiceProviderEntityMock();
    registerFallbackValue(
      CreateAndUpdateServiceProviderModel.fromEntity(
        createAndUpdateServiceProviderEntity:
            createAndUpdateServiceProviderEntityMock,
      ),
    );
  });

  test('Deve retornar void para chamada do update service provider repository',
      () async {
    when(
      () => updateServiceProviderDatasourceMock.call(
        createAndUpdateServiceProviderModel:
            CreateAndUpdateServiceProviderModel.fromEntity(
          createAndUpdateServiceProviderEntity:
              createAndUpdateServiceProviderEntityMock,
        ),
      ),
    ).thenAnswer((_) async => Future.value());
    final sut = await updateServiceProviderRepository.call(
      createAndUpdateServiceProviderEntity:
          createAndUpdateServiceProviderEntityMock,
    );
    expect(sut, const Right(null));
  });
  test(
      'Deve retornar um erro para chamada do update service provider repository',
      () async {
    when(
      () => updateServiceProviderDatasourceMock.call(
        createAndUpdateServiceProviderModel:
            CreateAndUpdateServiceProviderModel.fromEntity(
          createAndUpdateServiceProviderEntity:
              createAndUpdateServiceProviderEntityMock,
        ),
      ),
    ).thenThrow(ServiceProviderError(message: 'message'));
    final sut = updateServiceProviderRepository.call;
    expect(
      await sut(
        createAndUpdateServiceProviderEntity:
            createAndUpdateServiceProviderEntityMock,
      ),
      Left(
        ServiceProviderError(message: 'message'),
      ),
    );
  });
  test(
      'Deve chamar o datasource ao retornar void para chamada do update service provider repository',
      () async {
    when(
      () => updateServiceProviderDatasourceMock.call(
        createAndUpdateServiceProviderModel:
            CreateAndUpdateServiceProviderModel.fromEntity(
          createAndUpdateServiceProviderEntity:
              createAndUpdateServiceProviderEntityMock,
        ),
      ),
    ).thenAnswer((_) async => Future.value());
    final sut = await updateServiceProviderRepository.call(
      createAndUpdateServiceProviderEntity:
          createAndUpdateServiceProviderEntityMock,
    );
    expect(sut, const Right(null));
    verify(
      () => updateServiceProviderDatasourceMock.call(
        createAndUpdateServiceProviderModel:
            CreateAndUpdateServiceProviderModel.fromEntity(
          createAndUpdateServiceProviderEntity:
              any(named: 'createAndUpdateServiceProviderModel'),
        ),
      ),
    ).called(3);
  });
}
