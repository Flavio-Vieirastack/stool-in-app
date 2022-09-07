import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

class _AcceptedPaymentsRepositoryMock extends Mock
    implements ServiceProviderAcceptedPaymentsRepository {}

class _AcceptedPaymentEntityMock extends Mock
    implements AcceptedPaymentsEntity {}

void main() {
  late _AcceptedPaymentsRepositoryMock acceptedPaymentsRepositoryMock;
  late AcceptedPaymentsUsecase acceptedPaymentsUsecase;
  late _AcceptedPaymentEntityMock acceptedPaymentsMock;
  setUp(() {
    acceptedPaymentsRepositoryMock = _AcceptedPaymentsRepositoryMock();
    acceptedPaymentsMock = _AcceptedPaymentEntityMock();
    acceptedPaymentsUsecase = AcceptedPaymentsUsecaseImpl(
        serviceProviderAcceptedPaymentsRepository:
            acceptedPaymentsRepositoryMock);
  });
  group('createAcceptedPayment', () {
    test('Deve retornar void ao criar um pagamento com sucesso no usecase',
        () async {
      when(
        () => acceptedPaymentsRepositoryMock.createAcceptedPayment(
            serviceProviderid: 1, acceptedPaymentsEntity: acceptedPaymentsMock),
      ).thenAnswer((_) async => const Right(null));
      final sut = await acceptedPaymentsUsecase.createAcceptedPayment(
          serviceProviderid: 1, acceptedPaymentsEntity: acceptedPaymentsMock);
      expect(sut, const Right(null));
    });
    test(
        'Deve chamar o repository ao retornar void ao criar um pagamento com sucesso no usecase',
        () async {
      when(
        () => acceptedPaymentsRepositoryMock.createAcceptedPayment(
            serviceProviderid: 1, acceptedPaymentsEntity: acceptedPaymentsMock),
      ).thenAnswer((_) async => const Right(null));
      final sut = await acceptedPaymentsUsecase.createAcceptedPayment(
          serviceProviderid: 1, acceptedPaymentsEntity: acceptedPaymentsMock);
      expect(sut, const Right(null));
      verify(
        () => acceptedPaymentsRepositoryMock.createAcceptedPayment(
            serviceProviderid: 1, acceptedPaymentsEntity: acceptedPaymentsMock),
      ).called(1);
    });
    test('Deve retornar um erro ao criar um pagamento com sucesso no usecase',
        () async {
      when(
        () => acceptedPaymentsRepositoryMock.createAcceptedPayment(
            serviceProviderid: 1, acceptedPaymentsEntity: acceptedPaymentsMock),
      ).thenAnswer((_) async => Left(AcceptedPaymentsError(message: '')));
      final sut = await acceptedPaymentsUsecase.createAcceptedPayment(
          serviceProviderid: 1, acceptedPaymentsEntity: acceptedPaymentsMock);
      expect(sut, Left(AcceptedPaymentsError(message: '')));
    });
  });
  group('deleteAcceptedPayment', () {
    test('Deve retornar void ao deletar um pagamento aceito no usecase',
        () async {
      when(
        () =>
            acceptedPaymentsRepositoryMock.deleteAcceptedPayment(paymentId: 1),
      ).thenAnswer((_) async => const Right(null));
      final sut =
          await acceptedPaymentsUsecase.deleteAcceptedPayment(paymentId: 1);
      expect(sut, const Right(null));
    });
    test(
        'Deve chamar o repository ao retornar void ao deletar um pagamento aceito no usecase',
        () async {
      when(
        () =>
            acceptedPaymentsRepositoryMock.deleteAcceptedPayment(paymentId: 1),
      ).thenAnswer((_) async => const Right(null));
      final sut =
          await acceptedPaymentsUsecase.deleteAcceptedPayment(paymentId: 1);
      expect(sut, const Right(null));
      verify(
        () =>
            acceptedPaymentsRepositoryMock.deleteAcceptedPayment(paymentId: 1),
      ).called(1);
    });
    test('Deve retornar um erro ao deletar um pagamento aceito no usecase',
        () async {
      when(
        () =>
            acceptedPaymentsRepositoryMock.deleteAcceptedPayment(paymentId: 1),
      ).thenAnswer((_) async => Left(AcceptedPaymentsError(message: '')));
      final sut =
          await acceptedPaymentsUsecase.deleteAcceptedPayment(paymentId: 1);
      expect(sut, Left(AcceptedPaymentsError(message: '')));
    });
  });
  group('getAcceptedPaymentUnique', () {
    test(
        'Deve retornar uma entidade de pagamento aceito ao fazer get unique no usecase',
        () async {
      when(
        () => acceptedPaymentsRepositoryMock.getAcceptedPaymentUnique(
          paymentId: 1,
        ),
      ).thenAnswer((_) async => Right(acceptedPaymentsMock));
      final sut =
          await acceptedPaymentsUsecase.getAcceptedPaymentUnique(paymentId: 1);
      expect(sut, Right(acceptedPaymentsMock));
    });
    test(
        'Deve chamar o repository ao retornar uma entidade de pagamento aceito ao fazer get unique no usecase',
        () async {
      when(
        () => acceptedPaymentsRepositoryMock.getAcceptedPaymentUnique(
          paymentId: 1,
        ),
      ).thenAnswer((_) async => Right(acceptedPaymentsMock));
      final sut =
          await acceptedPaymentsUsecase.getAcceptedPaymentUnique(paymentId: 1);
      expect(sut, Right(acceptedPaymentsMock));
      verify(
        () => acceptedPaymentsRepositoryMock.getAcceptedPaymentUnique(
            paymentId: 1),
      ).called(1);
    });
    test('Deve retornar um erro ao fazer get unique no usecase', () async {
      when(
        () => acceptedPaymentsRepositoryMock.getAcceptedPaymentUnique(
          paymentId: 1,
        ),
      ).thenAnswer((_) async => Left(AcceptedPaymentsError(message: '')));
      final sut =
          await acceptedPaymentsUsecase.getAcceptedPaymentUnique(paymentId: 1);
      expect(sut, Left(AcceptedPaymentsError(message: '')));
    });
  });
  group('updateAcceptedPayment', () {
    test('Deve retornar void ao fazer update dos pagamentos aceitos no usecase',
        () async {
      when(
        () => acceptedPaymentsRepositoryMock.updateAcceptedPayment(
            paymentId: 1, acceptedPaymentsEntity: acceptedPaymentsMock),
      ).thenAnswer((_) async => const Right(null));
      final sut = await acceptedPaymentsUsecase.updateAcceptedPayment(
          paymentId: 1, acceptedPaymentsEntity: acceptedPaymentsMock);
      expect(sut, const Right(null));
    });
    test(
        'Deve chamar o repository ao retornar void ao fazer update dos pagamentos aceitos no usecase',
        () async {
      when(
        () => acceptedPaymentsRepositoryMock.updateAcceptedPayment(
            paymentId: 1, acceptedPaymentsEntity: acceptedPaymentsMock),
      ).thenAnswer((_) async => const Right(null));
      final sut = await acceptedPaymentsUsecase.updateAcceptedPayment(
          paymentId: 1, acceptedPaymentsEntity: acceptedPaymentsMock);
      expect(sut, const Right(null));
      verify(
        () => acceptedPaymentsRepositoryMock.updateAcceptedPayment(
            paymentId: 1, acceptedPaymentsEntity: acceptedPaymentsMock),
      ).called(1);
    });
    test(
        'Deve retornar um erro ao fazer update dos pagamentos aceitos no usecase',
        () async {
      when(
        () => acceptedPaymentsRepositoryMock.updateAcceptedPayment(
            paymentId: 1, acceptedPaymentsEntity: acceptedPaymentsMock),
      ).thenAnswer((_) async => Left(AcceptedPaymentsError(message: '')));
      final sut = await acceptedPaymentsUsecase.updateAcceptedPayment(
          paymentId: 1, acceptedPaymentsEntity: acceptedPaymentsMock);
      expect(sut, Left(AcceptedPaymentsError(message: '')));
    });
  });
 
}
