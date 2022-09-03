import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in/features/home/data/model/service_provider/accepted_payments_model.dart';

import '../../../../../mock/accepted_payments_payload_mock.dart';

void main() {
  group('to-map', () {
    test('Deve retornar o valor correto para payment', () {
      final model = AcceptedPaymentsModel(payment: 'Teste');
      final sut = model.toMap()['paymenct'];
      const matcher = 'Teste';
      expect(sut, matcher);
    });
  });

  group('from-map list', () {
    test('Deve retornar o valor coreto para o id na lista', () {
      final model = acceptedPaymentsPayloadListMock
          .map((e) => AcceptedPaymentsModel.fromMap(e))
          .toList();
      final sut = model[0].id;
      const matcher = 2;
      expect(sut, matcher);
      expect(sut, isA<int>());
    });
    test('Deve retornar o valor coreto para o payment na lista', () {
      final model = acceptedPaymentsPayloadListMock
          .map((e) => AcceptedPaymentsModel.fromMap(e))
          .toList();
      final sut = model[0].payment;
      const matcher = 'dictum';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
  });
  group('from-map unique', () {
    test('Deve retornar o valor coreto para o id unique', () {
      final model = AcceptedPaymentsModel.fromMap(acceptedPaymentsPayloadMock);
      final sut = model.id;
      const matcher = 2;
      expect(sut, matcher);
      expect(sut, isA<int>());
    });
    test('Deve retornar o valor coreto para o payment unique', () {
      final model = acceptedPaymentsPayloadListMock
          .map((e) => AcceptedPaymentsModel.fromMap(e))
          .toList();
      final sut = model[0].payment;
      const matcher = 'dictum';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
  });
}
