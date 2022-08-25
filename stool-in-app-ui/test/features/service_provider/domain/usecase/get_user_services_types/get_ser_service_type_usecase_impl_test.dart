import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/create_service_types_entity.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/service_types_return_entity.dart';
import 'package:stool_in/features/service_provider/domain/error/get_user_service_types_error.dart';
import 'package:stool_in/features/service_provider/domain/repository/get_user_service_types/get_user_service_types_repository.dart';
import 'package:stool_in/features/service_provider/domain/usecase/get_user_services_types/get_ser_service_type_usecase_impl.dart';
import 'package:stool_in/features/service_provider/domain/usecase/get_user_services_types/get_user_service_tyes_usecase.dart';

class _GetUserServiceTypesRepositoryMock extends Mock
    implements GetUserServiceTypesRepository {}

class _CreateServiceTypeEntityMock extends Mock
    implements CreateServiceTypesEntity {}

class _ServiceTypesReturnEntityMock extends Mock
    implements ServiceTypesReturnEntity {}

void main() {
  late _GetUserServiceTypesRepositoryMock getUserServiceTypesRepositoryMock;
  late GetUserServiceTyesUseCase getUserServiceTyesUseCase;
  late List<_ServiceTypesReturnEntityMock> serviceTypesReturnEntityMock;
  late _CreateServiceTypeEntityMock createServiceTypeEntityMock;
  setUp(() {
    getUserServiceTypesRepositoryMock = _GetUserServiceTypesRepositoryMock();
    createServiceTypeEntityMock = _CreateServiceTypeEntityMock();
    serviceTypesReturnEntityMock = [_ServiceTypesReturnEntityMock()];
    getUserServiceTyesUseCase = GetSerServiceTypeUsecaseImpl(
        getUserServiceTypesRepository: getUserServiceTypesRepositoryMock);
  });
  test('Deve retornar uma lista de serviceTypesReturnEntityMock corretamente',
      () async {
    when(
      () => getUserServiceTypesRepositoryMock.call(
          serviceProviderId: createServiceTypeEntityMock),
    ).thenAnswer((_) async => Right(serviceTypesReturnEntityMock));
    final sut = await getUserServiceTyesUseCase.call(
        serviceProviderId: createServiceTypeEntityMock);
    expect(sut, Right(serviceTypesReturnEntityMock));
  });
  test(
      'Deve chamar o repository ao retornar uma lista de serviceTypesReturnEntityMock corretamente',
      () async {
    when(
      () => getUserServiceTypesRepositoryMock.call(
          serviceProviderId: createServiceTypeEntityMock),
    ).thenAnswer((_) async => Right(serviceTypesReturnEntityMock));
    final sut = await getUserServiceTyesUseCase.call(
        serviceProviderId: createServiceTypeEntityMock);
    expect(sut, Right(serviceTypesReturnEntityMock));
    verify(
      () => getUserServiceTypesRepositoryMock.call(
          serviceProviderId: createServiceTypeEntityMock),
    ).called(1);
  });
  test('Deve retornar um erro ao tentar pegar service types do usuario',
      () async {
    when(
      () => getUserServiceTypesRepositoryMock.call(
          serviceProviderId: createServiceTypeEntityMock),
    ).thenAnswer(
        (_) async => Left(GetUserServiceTypesError(message: 'message')));
    final sut = await getUserServiceTyesUseCase.call(
        serviceProviderId: createServiceTypeEntityMock);
    expect(sut, Left(GetUserServiceTypesError(message: 'message')));
    
  });
}
