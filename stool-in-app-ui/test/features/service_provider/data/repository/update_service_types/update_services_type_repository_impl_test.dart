import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_logic/stool_in_logic.dart';


class _UpdateServiceTypesDatasourceMock extends Mock
    implements UpdateServiceTypeDatasource {}

void main() {
  late _UpdateServiceTypesDatasourceMock updateServiceTypesDatasourceMock;
  late UpdateServiceTypesRepository updateServiceTypesRepository;
  late CreateServiceTypesEntity createServiceTypeEntity;
  setUpAll(() {
    createServiceTypeEntity = CreateServiceTypesEntity(serviceProviderId: 1);
    updateServiceTypesDatasourceMock = _UpdateServiceTypesDatasourceMock();
    updateServiceTypesRepository = UpdateServicesTypeRepositoryImpl(
        updateServiceTypeDatasource: updateServiceTypesDatasourceMock);
    registerFallbackValue(CreateServiceTypeModel.fromEntity(
        createServiceTypesEntity: createServiceTypeEntity));
  });
  test(
      'Deve retornar void ao chamar o repositoy para fazer update do service type',
      () async {
    when(
      () => updateServiceTypesDatasourceMock.call(
          createServiceTypeModel: any(named: 'createServiceTypeModel')),
    ).thenAnswer((_) async => Future.value());
    final sut = await updateServiceTypesRepository.call(
        createServiceTypesEntity: createServiceTypeEntity);
    expect(sut, const Right(null));
  });
  test(
      'Deve chamar o datasource ao retornar void quando chamar o repositoy para fazer update do service type',
      () async {
    when(
      () => updateServiceTypesDatasourceMock.call(
          createServiceTypeModel: any(named: 'createServiceTypeModel')),
    ).thenAnswer((_) async => Future.value());
    final sut = await updateServiceTypesRepository.call(
        createServiceTypesEntity: createServiceTypeEntity);
    expect(sut, const Right(null));
    verify(
      () => updateServiceTypesDatasourceMock.call(
          createServiceTypeModel: any(named: 'createServiceTypeModel')),
    ).called(2);
  });
  test(
      'Deve retornar um erro quando chamar o repositoy para fazer update do service type',
      () async {
    when(
      () => updateServiceTypesDatasourceMock.call(
          createServiceTypeModel: any(named: 'createServiceTypeModel')),
    ).thenThrow(UpdateServiceTypesError(message: 'message'));
    final sut = await updateServiceTypesRepository.call(
        createServiceTypesEntity: createServiceTypeEntity);
    expect(sut, Left(UpdateServiceTypesError(message: 'message')));
    
  });
}
