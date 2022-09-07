import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_logic/stool_in_logic.dart';


class _AcceptedPaymentsDatasourceMock extends Mock
    implements ServiceProviderAcceptedPaymentsDatasource {}

class _AcceptedPaymentsEntityMock extends Mock
    implements AcceptedPaymentsEntity {}

void main() {
  late _AcceptedPaymentsDatasourceMock acceptedPaymentsDatasourceMock;
  late _AcceptedPaymentsEntityMock acceptedPaymentsEntityMock;
  late ServiceProviderAcceptedPaymentsRepository
      serviceProviderAcceptedPaymentsRepository;
  setUp(() {
    acceptedPaymentsDatasourceMock = _AcceptedPaymentsDatasourceMock();
    serviceProviderAcceptedPaymentsRepository =
        ServiceProviderAcceptedPaymentsRepositoryImpl(
      serviceProviderAcceptedPaymentsDatasource: acceptedPaymentsDatasourceMock,
    );
    acceptedPaymentsEntityMock = _AcceptedPaymentsEntityMock();
    registerFallbackValue(AcceptedPaymentsModel.fromEntity(
        acceptedPaymentsEntity: acceptedPaymentsEntityMock));
  });
  group('createAcceptedPayment', () {
    test('Deve retornar void ao criar um pagamento aceito no repository',
        () async {
      when(
        () => acceptedPaymentsDatasourceMock.createAcceptedPayment(
          serviceProviderid: 1,
          acceptedPaymentsModel: any(named: 'acceptedPaymentsModel'),
        ),
      ).thenAnswer((_) async => Future.value());
      final sut =
          await serviceProviderAcceptedPaymentsRepository.createAcceptedPayment(
              serviceProviderid: 1,
              acceptedPaymentsEntity: acceptedPaymentsEntityMock);
      expect(sut, const Right(null));
    });
    test(
        'Deve chamar o datasource ao retornar void ao criar um pagamento aceito no repository',
        () async {
      when(
        () => acceptedPaymentsDatasourceMock.createAcceptedPayment(
          serviceProviderid: 1,
          acceptedPaymentsModel: any(named: 'acceptedPaymentsModel'),
        ),
      ).thenAnswer((_) async => Future.value());
      final sut =
          await serviceProviderAcceptedPaymentsRepository.createAcceptedPayment(
              serviceProviderid: 1,
              acceptedPaymentsEntity: acceptedPaymentsEntityMock);
      expect(sut, const Right(null));
      verify(
        () => acceptedPaymentsDatasourceMock.createAcceptedPayment(
            serviceProviderid: 1,
            acceptedPaymentsModel: any(named: 'acceptedPaymentsModel')),
      ).called(1);
    });
    test('Deve retornar um erro ao criar um pagamento aceito no repository',
        () async {
      when(
        () => acceptedPaymentsDatasourceMock.createAcceptedPayment(
          serviceProviderid: 1,
          acceptedPaymentsModel: any(named: 'acceptedPaymentsModel'),
        ),
      ).thenThrow(AcceptedPaymentsError(message: 'message'));
      final sut =
          await serviceProviderAcceptedPaymentsRepository.createAcceptedPayment(
              serviceProviderid: 1,
              acceptedPaymentsEntity: acceptedPaymentsEntityMock);
      expect(sut, Left(AcceptedPaymentsError(message: 'message')));
    });
  });
  group('deleteAcceptedPayment', () {
    test('Deve retornar void ao deletar um pagamento aceito no repository impl',
        () async {
      when(
        () =>
            acceptedPaymentsDatasourceMock.deleteAcceptedPayment(paymentId: 1),
      ).thenAnswer((_) async => Future.value());
      final sut = await serviceProviderAcceptedPaymentsRepository
          .deleteAcceptedPayment(paymentId: 1);
      expect(sut, const Right(null));
    });
    test(
        'Deve chamar o datasouce ao retornar void ao deletar um pagamento aceito no repository impl',
        () async {
      when(
        () =>
            acceptedPaymentsDatasourceMock.deleteAcceptedPayment(paymentId: 1),
      ).thenAnswer((_) async => Future.value());
      final sut = await serviceProviderAcceptedPaymentsRepository
          .deleteAcceptedPayment(paymentId: 1);
      expect(sut, const Right(null));
      verify(
        () =>
            acceptedPaymentsDatasourceMock.deleteAcceptedPayment(paymentId: 1),
      ).called(1);
    });
    test(
        'Deve retornar um erro ao deletar um pagamento aceito no repository impl',
        () async {
      when(
        () =>
            acceptedPaymentsDatasourceMock.deleteAcceptedPayment(paymentId: 1),
      ).thenThrow(AcceptedPaymentsError(message: 'message'));
      final sut = await serviceProviderAcceptedPaymentsRepository
          .deleteAcceptedPayment(paymentId: 1);
      expect(sut, left(AcceptedPaymentsError(message: 'message')));
    });
  });
  group('getAcceptedPaymentUnique', () {
    test('Deve retornar um objeto accepted payment no repository impl',
        () async {
      when(
        () => acceptedPaymentsDatasourceMock.getAcceptedPaymentUnique(
            paymentId: 1),
      ).thenAnswer((_) async => acceptedPaymentsEntityMock);
      final sut = await serviceProviderAcceptedPaymentsRepository
          .getAcceptedPaymentUnique(paymentId: 1);
      expect(sut, Right(acceptedPaymentsEntityMock));
    });
    test(
        'Deve chamar o datasource ao retornar um objeto accepted payment no repository impl',
        () async {
      when(
        () => acceptedPaymentsDatasourceMock.getAcceptedPaymentUnique(
            paymentId: 1),
      ).thenAnswer((_) async => acceptedPaymentsEntityMock);
      final sut = await serviceProviderAcceptedPaymentsRepository
          .getAcceptedPaymentUnique(paymentId: 1);
      expect(sut, Right(acceptedPaymentsEntityMock));
      verify(
        () => acceptedPaymentsDatasourceMock.getAcceptedPaymentUnique(
            paymentId: 1),
      ).called(1);
    });
    test(
        'Deve chamar o datasource ao retornar um objeto accepted payment no repository impl',
        () async {
      when(
        () => acceptedPaymentsDatasourceMock.getAcceptedPaymentUnique(
            paymentId: 1),
      ).thenAnswer((_) async => acceptedPaymentsEntityMock);
      final sut = await serviceProviderAcceptedPaymentsRepository
          .getAcceptedPaymentUnique(paymentId: 1);
      expect(sut, Right(acceptedPaymentsEntityMock));
      verify(
        () => acceptedPaymentsDatasourceMock.getAcceptedPaymentUnique(
            paymentId: 1),
      ).called(1);
    });
    test(
        'Deve retornar um erro ao tentar retornar um objeto accepted payment no repository impl',
        () async {
      when(
        () => acceptedPaymentsDatasourceMock.getAcceptedPaymentUnique(
            paymentId: 1),
      ).thenThrow(AcceptedPaymentsError(message: 'message'));
      final sut = await serviceProviderAcceptedPaymentsRepository
          .getAcceptedPaymentUnique(paymentId: 1);
      expect(sut, Left(AcceptedPaymentsError(message: 'message')));
    });
  });
  group('updateAcceptedPayment', () {
    test(
        'Deve retornar void ao fazer update de um pagamento aceito no repository impl',
        () async {
      when(
        () => acceptedPaymentsDatasourceMock.updateAcceptedPayment(
            paymentId: 1,
            acceptedPaymentsModel: any(named: 'acceptedPaymentsModel')),
      ).thenAnswer((_) async => Future.value());
      final sut =
          await serviceProviderAcceptedPaymentsRepository.updateAcceptedPayment(
              paymentId: 1, acceptedPaymentsEntity: acceptedPaymentsEntityMock);
      expect(sut, const Right(null));
    });
    test(
        'Deve chamar o datasource ao retornar void ao fazer update de um pagamento aceito no repository impl',
        () async {
      when(
        () => acceptedPaymentsDatasourceMock.updateAcceptedPayment(
            paymentId: 1,
            acceptedPaymentsModel: any(named: 'acceptedPaymentsModel')),
      ).thenAnswer((_) async => Future.value());
      final sut =
          await serviceProviderAcceptedPaymentsRepository.updateAcceptedPayment(
              paymentId: 1, acceptedPaymentsEntity: acceptedPaymentsEntityMock);
      expect(sut, const Right(null));
      verify(
        () => acceptedPaymentsDatasourceMock.updateAcceptedPayment(
            paymentId: 1,
            acceptedPaymentsModel: any(named: 'acceptedPaymentsModel')),
      ).called(1);
    });
    test(
        'Deve retornar um erro ao fazer update de um pagamento aceito no repository impl',
        () async {
      when(
        () => acceptedPaymentsDatasourceMock.updateAcceptedPayment(
            paymentId: 1,
            acceptedPaymentsModel: any(named: 'acceptedPaymentsModel')),
      ).thenThrow(AcceptedPaymentsError(message: 'message'));
      final sut =
          await serviceProviderAcceptedPaymentsRepository.updateAcceptedPayment(
              paymentId: 1, acceptedPaymentsEntity: acceptedPaymentsEntityMock);
      expect(sut, Left(AcceptedPaymentsError(message: 'message')));
    });
  });
}
