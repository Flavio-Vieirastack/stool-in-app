import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/service_provider/data/datasource/create_service_type/create_service_type_datasource.dart';
import 'package:stool_in/features/service_provider/data/model/service_type/create_service_type_model.dart';
import 'package:stool_in/features/service_provider/data/repository/create_service_type/create_service_type_repository_impl.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/create_service_types_entity.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/service_types_return_entity.dart';
import 'package:stool_in/features/service_provider/domain/error/create_service_type_error.dart';
import 'package:stool_in/features/service_provider/domain/repository/create_service_type/create_service_type_repository.dart';

class _CreateServiceTypesDatasourceMock extends Mock
    implements CreateServiceTypeDatasource {}

class _CreateServiceTyeReturnEntityMock extends Mock
    implements ServiceTypesReturnEntity {}

void main() {
  late _CreateServiceTypesDatasourceMock createServiceTypesDatasourceMock;
  late CreateServiceTypeRepository createServiceTypeRepository;
  late CreateServiceTypesEntity createServiceTypeEntityMock;
  late _CreateServiceTyeReturnEntityMock createServiceTyeReturnEntityMock;
  setUpAll(() {
    createServiceTyeReturnEntityMock = _CreateServiceTyeReturnEntityMock();
    createServiceTypeEntityMock =
        CreateServiceTypesEntity(serviceProviderId: 1);
    createServiceTypesDatasourceMock = _CreateServiceTypesDatasourceMock();
    createServiceTypeRepository = CreateServiceTypeRepositoryImpl(
        createServiceTypeDatasource: createServiceTypesDatasourceMock);
    registerFallbackValue(CreateServiceTypeModel.fromEntity(
        createServiceTypesEntity: createServiceTypeEntityMock));
  });
  test('Deve retornar a entidade de criação de service type corretamente',
      () async {
    when(
      () => createServiceTypesDatasourceMock.call(
        createServiceTypeModel: any(named: 'createServiceTypeModel'),
      ),
    ).thenAnswer((_) async => createServiceTyeReturnEntityMock);
    final sut = await createServiceTypeRepository.call(
        createServiceTypesEntity: createServiceTypeEntityMock);
    expect(sut, Right(createServiceTyeReturnEntityMock));
  });
  test(
      'Deve chamar o datasource ao retornar a entidade de criação de service type corretamente',
      () async {
    when(
      () => createServiceTypesDatasourceMock.call(
        createServiceTypeModel: any(named: 'createServiceTypeModel'),
      ),
    ).thenAnswer((_) async => createServiceTyeReturnEntityMock);
    final sut = await createServiceTypeRepository.call(
        createServiceTypesEntity: createServiceTypeEntityMock);
    expect(sut, Right(createServiceTyeReturnEntityMock));
    verify(
      () => createServiceTypesDatasourceMock.call(
          createServiceTypeModel: any(named: 'createServiceTypeModel')),
    ).called(2);
  });
  test('Deve retornar um erro ao criar um service type', () async {
    when(
      () => createServiceTypesDatasourceMock.call(
        createServiceTypeModel: any(named: 'createServiceTypeModel'),
      ),
    ).thenThrow(CreateServiceTypeError(message: 'message'));
    final sut = await createServiceTypeRepository.call(
        createServiceTypesEntity: createServiceTypeEntityMock);
    expect(sut, Left(CreateServiceTypeError(message: 'message')));
  });
}
