import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/create_service_types_entity.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/service_types_return_entity.dart';
import 'package:stool_in/features/service_provider/domain/error/create_service_type_error.dart';
import 'package:stool_in/features/service_provider/domain/repository/create_service_type/create_service_type_repository.dart';
import 'package:stool_in/features/service_provider/domain/usecase/create_service_type/create_service_type_usecase.dart';
import 'package:stool_in/features/service_provider/domain/usecase/create_service_type/create_service_type_usecase_impl.dart';

class CreateServiceTypeRepositoryMock extends Mock
    implements CreateServiceTypeRepository {}

class CreateServiceTyeReturnEntityMock extends Mock
    implements ServiceTypesReturnEntity {}

class CreateServiceTypeEntityMock extends Mock
    implements CreateServiceTypesEntity {}

void main() {
  late CreateServiceTypeRepositoryMock createServiceTypeRepositoryMock;
  late CreateServiceTypeUsecase createServiceTypeUsecase;
  late CreateServiceTypeEntityMock createServiceTypeEntityMock;
  late CreateServiceTyeReturnEntityMock createServiceTyeReturnEntityMock;
  setUp(() {
    createServiceTypeRepositoryMock = CreateServiceTypeRepositoryMock();
    createServiceTypeUsecase = CreateServiceTypeUsecaseImpl(
        createServiceTypeRepository: createServiceTypeRepositoryMock);
    createServiceTypeEntityMock = CreateServiceTypeEntityMock();
    createServiceTyeReturnEntityMock = CreateServiceTyeReturnEntityMock();
  });
  test('Deve retornar uma entidade de service type return entity', () async {
    when(
      () => createServiceTypeRepositoryMock.call(
          createServiceTypesEntity: createServiceTypeEntityMock),
    ).thenAnswer((_) async => Right(createServiceTyeReturnEntityMock));
    final sut = await createServiceTypeUsecase.call(
        createServiceTypesEntity: createServiceTypeEntityMock);
    expect(sut, Right(createServiceTyeReturnEntityMock));
  });
  test(
      'Deve chamar o repository ao retornar uma entidade de service type return entity',
      () async {
    when(
      () => createServiceTypeRepositoryMock.call(
          createServiceTypesEntity: createServiceTypeEntityMock),
    ).thenAnswer((_) async => Right(createServiceTyeReturnEntityMock));
    final sut = await createServiceTypeUsecase.call(
        createServiceTypesEntity: createServiceTypeEntityMock);
    expect(sut, Right(createServiceTyeReturnEntityMock));
    verify(
      () => createServiceTypeRepositoryMock.call(
          createServiceTypesEntity: createServiceTypeEntityMock),
    ).called(1);
  });
  test(
      'Deve retornar um erro ao retornar uma entidade de service type return entity',
      () async {
    when(
      () => createServiceTypeRepositoryMock.call(
          createServiceTypesEntity: createServiceTypeEntityMock),
    ).thenAnswer((_) async => Left(CreateServiceTypeError(message: 'message')));
    final sut = await createServiceTypeUsecase.call(
        createServiceTypesEntity: createServiceTypeEntityMock);
    expect(sut, Left(CreateServiceTypeError(message: 'message')));
  });
}