import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_app_logic/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in_app_logic/features/auth/domain/repository/user_data/user_data_sign_in_respository.dart';
import 'package:stool_in_app_logic/features/auth/domain/usecase/auth/auth_use_case.dart';
import 'package:stool_in_app_logic/stool_in_app_logic.dart';

class AuthMock extends Mock implements AuthUseCase {}

class RepositoryMock extends Mock implements UserDataSignInRepository {}

void main() {
  test('Deve retornar a entidade correta ao ser chamado', () async {
    final useCaseMock = AuthMock();
    final entity = UserDataEntity();
    when(
      () => useCaseMock.sendUserData(userDataEntity: entity),
    ).thenAnswer(
      (_) async => Right(
        UserDataEntity(),
      ),
    );
    final sut = await useCaseMock.sendUserData(userDataEntity: entity);
    expect(sut, Right(entity));
  });
  test('Deve chamar o repository ao ser chamado', () async {
    final useCaseMock = AuthMock();
    final entity = UserDataEntity();
    final repository = RepositoryMock();
    when(
      () => useCaseMock.sendUserData(userDataEntity: entity),
    ).thenAnswer(
      (_) async => Right(
        UserDataEntity(),
      ),
    );
    final sut = await useCaseMock.sendUserData(userDataEntity: entity);
    expect(sut, Right(entity));
    verify(
      () => repository.sendUserData(userDataEntity: entity),
    ).called(1);
  });
}
