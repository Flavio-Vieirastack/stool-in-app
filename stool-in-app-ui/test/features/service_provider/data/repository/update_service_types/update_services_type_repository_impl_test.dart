import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/service_provider/data/datasource/update_service_types/update_service_type_datasource.dart';
import 'package:stool_in/features/service_provider/data/model/service_type/create_service_type_model.dart';
import 'package:stool_in/features/service_provider/data/repository/update_service_types/update_services_type_repository_impl.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/create_service_types_entity.dart';
import 'package:stool_in/features/service_provider/domain/error/update_service_types_error.dart';
import 'package:stool_in/features/service_provider/domain/repository/update_service_types/update_service_types_repository.dart';

class _UpdateServiceTypesDatasourceMock extends Mock
    implements UpdateServiceTypeDatasource {}

void main() {
  late _UpdateServiceTypesDatasourceMock _updateServiceTypesDatasourceMock;
  late UpdateServiceTypesRepository updateServiceTypesRepository;
  late CreateServiceTypesEntity createServiceTypeEntity;
  setUpAll(() {
    createServiceTypeEntity = CreateServiceTypesEntity(serviceProviderId: 1);
    _updateServiceTypesDatasourceMock = _UpdateServiceTypesDatasourceMock();
    updateServiceTypesRepository = UpdateServicesTypeRepositoryImpl(
        updateServiceTypeDatasource: _updateServiceTypesDatasourceMock);
    registerFallbackValue(CreateServiceTypeModel.fromEntity(
        createServiceTypesEntity: createServiceTypeEntity));
  });
  test(
      'Deve retornar void ao chamar o repositoy para fazer update do service type',
      () async {
    when(
      () => _updateServiceTypesDatasourceMock.call(
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
      () => _updateServiceTypesDatasourceMock.call(
          createServiceTypeModel: any(named: 'createServiceTypeModel')),
    ).thenAnswer((_) async => Future.value());
    final sut = await updateServiceTypesRepository.call(
        createServiceTypesEntity: createServiceTypeEntity);
    expect(sut, const Right(null));
    verify(
      () => _updateServiceTypesDatasourceMock.call(
          createServiceTypeModel: any(named: 'createServiceTypeModel')),
    ).called(2);
  });
  test(
      'Deve retornar um erro quando chamar o repositoy para fazer update do service type',
      () async {
    when(
      () => _updateServiceTypesDatasourceMock.call(
          createServiceTypeModel: any(named: 'createServiceTypeModel')),
    ).thenThrow(UpdateServiceTypesError(message: 'message'));
    final sut = await updateServiceTypesRepository.call(
        createServiceTypesEntity: createServiceTypeEntity);
    expect(sut, Left(UpdateServiceTypesError(message: 'message')));
    
  });
}
