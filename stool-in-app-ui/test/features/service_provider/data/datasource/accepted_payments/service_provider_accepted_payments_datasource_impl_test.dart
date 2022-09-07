import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/stool_in_logic.dart';


import '../../../../../mock/accepted_payments_payload_mock.dart';

class _RestClientGetMock extends Mock implements RestClientGet {}

class _RestClientDeleteMock extends Mock implements RestClientDelete {}

class _RestClientPostMock extends Mock implements RestClientPost {}

class _RestClientPatchMock extends Mock implements RestClientPatch {}

void main() {
  late _RestClientDeleteMock restClientDeleteMock;
  late _RestClientGetMock restClientGetMock;
  late _RestClientPatchMock restClientPatchMock;
  late _RestClientPostMock restClientPostMock;
  late ServiceProviderAcceptedPaymentsDatasource
      serviceProviderAcceptedPaymentsDatasource;
  late AcceptedPaymentsModel acceptedPaymentsModel;
  setUp(() {
    restClientDeleteMock = _RestClientDeleteMock();
    restClientGetMock = _RestClientGetMock();
    restClientPatchMock = _RestClientPatchMock();
    restClientPostMock = _RestClientPostMock();
    serviceProviderAcceptedPaymentsDatasource =
        ServiceProviderAcceptedPaymentsDatasourceImpl(
      restClientDelete: restClientDeleteMock,
      restClientPatch: restClientPatchMock,
      restClientPost: restClientPostMock,
      restClientGet: restClientGetMock,
    );
    acceptedPaymentsModel = AcceptedPaymentsModel(payment: '');
  });
  group('createAcceptedPayment', () {
    test('Deve retornar void ao criar um pagamento aceito no datasource impl',
        () async {
      when(
        () => restClientPostMock.post(
            path: any(named: 'path'), data: acceptedPaymentsModel.toMap()),
      ).thenAnswer((_) async => RestClientResponse(statucCode: 200));
      final sut =
          serviceProviderAcceptedPaymentsDatasource.createAcceptedPayment(
              serviceProviderid: 1,
              acceptedPaymentsModel: acceptedPaymentsModel);
      expect(sut, isA<Future<void>>());
    });
    test(
        'Deve chamar o restclient post ao retornar void ao criar um pagamento aceito no datasource impl',
        () async {
      when(
        () => restClientPostMock.post(
            path: any(named: 'path'), data: acceptedPaymentsModel.toMap()),
      ).thenAnswer((_) async => RestClientResponse(statucCode: 200));
      final sut =
          serviceProviderAcceptedPaymentsDatasource.createAcceptedPayment(
              serviceProviderid: 1,
              acceptedPaymentsModel: acceptedPaymentsModel);
      expect(sut, isA<Future<void>>());
      verify(
        () => restClientPostMock.post(
            path: any(named: 'path'), data: acceptedPaymentsModel.toMap()),
      ).called(1);
    });
    test(
        'Deve retornar um erro ao criar um pagamento aceito no datasource impl',
        () async {
      when(
        () => restClientPostMock.post(
            path: any(named: 'path'), data: acceptedPaymentsModel.toMap()),
      ).thenThrow(AcceptedPaymentsError(message: 'message'));
      final sut =
          serviceProviderAcceptedPaymentsDatasource.createAcceptedPayment;
      expect(
          () async => sut(
              serviceProviderid: 1,
              acceptedPaymentsModel: acceptedPaymentsModel),
          throwsA(isA<AcceptedPaymentsError>()));
    });
  });
  group('deleteAcceptedPayment', () {
    test('Deve retornar void ao deletar um pagamento no datasource impl',
        () async {
      when(
        () => restClientDeleteMock.delete(path: any(named: 'path')),
      ).thenAnswer((_) async => RestClientResponse(statucCode: 200));
      final sut = serviceProviderAcceptedPaymentsDatasource
          .deleteAcceptedPayment(paymentId: 1);
      expect(sut, isA<Future<void>>());
    });
    test(
        'Deve chamar o restclient delete ao retornar void ao deletar um pagamento no datasource impl',
        () async {
      when(
        () => restClientDeleteMock.delete(path: any(named: 'path')),
      ).thenAnswer((_) async => RestClientResponse(statucCode: 200));
      final sut = serviceProviderAcceptedPaymentsDatasource
          .deleteAcceptedPayment(paymentId: 1);
      expect(sut, isA<Future<void>>());
      verify(
        () => restClientDeleteMock.delete(path: any(named: 'path')),
      ).called(1);
    });
    test('Deve retornar um erro ao deletar um pagamento no datasource impl',
        () async {
      when(
        () => restClientDeleteMock.delete(path: any(named: 'path')),
      ).thenThrow(AcceptedPaymentsError(message: 'message'));
      final sut =
          serviceProviderAcceptedPaymentsDatasource.deleteAcceptedPayment;
      expect(
          () async => sut(paymentId: 1), throwsA(isA<AcceptedPaymentsError>()));
    });
  });
  group('getAcceptedPaymentUnique', () {
    test('Deve retornar uma entidade de accepted payment no datasource impl',
        () async {
      when(
        () => restClientGetMock.get(path: any(named: 'path')),
      ).thenAnswer((_) async => RestClientResponse(
          statucCode: 200, data: acceptedPaymentsPayloadMock));
      final sut = await serviceProviderAcceptedPaymentsDatasource
          .getAcceptedPaymentUnique(paymentId: 1);
      expect(sut, isA<AcceptedPaymentsEntity>());
    });
    test(
        'Deve chamar o restclient get ao retornar uma entidade de accepted payment no datasource impl',
        () async {
      when(
        () => restClientGetMock.get(path: any(named: 'path')),
      ).thenAnswer((_) async => RestClientResponse(
          statucCode: 200, data: acceptedPaymentsPayloadMock));
      final sut = await serviceProviderAcceptedPaymentsDatasource
          .getAcceptedPaymentUnique(paymentId: 1);
      expect(sut, isA<AcceptedPaymentsEntity>());
      verify(
        () => restClientGetMock.get(path: any(named: 'path')),
      ).called(1);
    });
    test(
        'Deve retornar um erro ao tentar retornar uma entidade de accepted payment no datasource impl',
        () async {
      when(
        () => restClientGetMock.get(path: any(named: 'path')),
      ).thenThrow(AcceptedPaymentsError(message: 'message'));
      final sut =
          serviceProviderAcceptedPaymentsDatasource.getAcceptedPaymentUnique;
      expect(
          () async => sut(paymentId: 1), throwsA(isA<AcceptedPaymentsError>()));
    });
  });
  group('updateAcceptedPayment', () {
    test(
        'Deve retornar void ao fazer update de um pagamento aceito no datasouce impl',
        () async {
      when(
        () => restClientPatchMock.patch(
            path: any(named: 'path'), data: acceptedPaymentsModel.toMap()),
      ).thenAnswer((_) async => RestClientResponse(statucCode: 200));
      final sut =
          serviceProviderAcceptedPaymentsDatasource.updateAcceptedPayment(
              paymentId: 1, acceptedPaymentsModel: acceptedPaymentsModel);
      expect(sut, isA<Future<void>>());
    });
    test(
        'Deve chamar o restclient patch ao retornar void ao fazer update de um pagamento aceito no datasouce impl',
        () async {
      when(
        () => restClientPatchMock.patch(
            path: any(named: 'path'), data: acceptedPaymentsModel.toMap()),
      ).thenAnswer((_) async => RestClientResponse(statucCode: 200));
      final sut =
          serviceProviderAcceptedPaymentsDatasource.updateAcceptedPayment(
              paymentId: 1, acceptedPaymentsModel: acceptedPaymentsModel);
      expect(sut, isA<Future<void>>());
      verify(
        () => restClientPatchMock.patch(
            path: any(named: 'path'), data: acceptedPaymentsModel.toMap()),
      ).called(1);
    });
    test(
        'Deve retornar um erro ao fazer update de um pagamento aceito no datasouce impl',
        () async {
      when(
        () => restClientPatchMock.patch(
            path: any(named: 'path'), data: acceptedPaymentsModel.toMap()),
      ).thenThrow(AcceptedPaymentsError(message: 'message'));
      final sut =
          serviceProviderAcceptedPaymentsDatasource.updateAcceptedPayment;
      expect(
          () async =>
              sut(paymentId: 1, acceptedPaymentsModel: acceptedPaymentsModel),
          throwsA(isA<AcceptedPaymentsError>()));
    });
  });
}
