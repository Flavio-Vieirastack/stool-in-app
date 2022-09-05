import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in/features/profile/data/model/user_data_unique_model.dart';

import '../../../../mock/user_data_unique_model_mock.dart';

void main() {
  group('User data unique', () {
    test('Deve retornar o valor correto para userName', () {
      final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
      final sut = model.userName;
      const matcher = 'Duncan Fadel';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test('Deve retornar o valor correto para cep', () {
      final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
      final sut = model.cep;
      const matcher = '55017';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test('Deve retornar o valor correto para city', () {
      final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
      final sut = model.city;
      const matcher = 'East New Trevion';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test('Deve retornar o valor correto para district', () {
      final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
      final sut = model.district;
      const matcher = 'Murray Hill';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test('Deve retornar o valor correto para houseNumber', () {
      final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
      final sut = model.houseNumber;
      const matcher = '265964';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test('Deve retornar o valor correto para referencePoint', () {
      final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
      final sut = model.referencePoint;
      const matcher = 'Dyker Heights';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test('Deve retornar o valor correto para serviceProviderId', () {
      final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
      final sut = model.serviceProviderId;
      const matcher = 2;
      expect(sut, matcher);
      expect(sut, isA<int>());
    });
    test('Deve retornar o valor correto para street', () {
      final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
      final sut = model.street;
      const matcher = 'Murazik Inlet';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test('Deve retornar o valor correto para userFirebasePushToken', () {
      final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
      final sut = model.userFirebasePushToken;
      const matcher = "OdQmC'hZCo_,i0YZL";
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test('Deve retornar o valor correto para userFirebaseUuid', () {
      final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
      final sut = model.userFirebaseUuid;
      const matcher = "H#.Mr^w%!]tqnrPf(^HWfk1gCL!vA[";
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test('Deve retornar o valor correto para userLocationLatitude', () {
      final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
      final sut = model.userLocationLatitude;
      const matcher = 10.05458724418554;
      expect(sut, matcher);
      expect(sut, isA<double>());
    });
    test('Deve retornar o valor correto para userLocationLongitude', () {
      final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
      final sut = model.userLocationLongitude;
      const matcher = 10.68846975445786;
      expect(sut, matcher);
      expect(sut, isA<double>());
    });
    test('Deve retornar o valor correto para userPhotoUrl', () {
      final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
      final sut = model.userPhotoUrl;
      const matcher = 'https://source.unsplash.com/640x480';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test('Deve retornar o valor correto para userState', () {
      final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
      final sut = model.userState;
      const matcher = 'Utah';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
  });

  group('ServicesContractedModel', () {
    test(
      'deve retornar o tamanho correto da lista',
      () {
        final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
        final sut = model.servicesContacted.length;
        const matcher = 3;
        expect(sut, matcher);
        expect(sut, isA<int>());
      },
    );
    test(
      'deve retornar o valor correto para ServicesContractedModel no campo distance',
      () {
        final model =
            UserDataUniqueModel.fromMap(userDataUniqueModelMock, distance: 50);
        final sut = model.servicesContacted[0].distance;
        const matcher = 50;
        expect(sut, matcher);
        expect(sut, isA<int>());
      },
    );
    test(
      'deve retornar o valor correto para ServicesContractedModel no campo id',
      () {
        final model =
            UserDataUniqueModel.fromMap(userDataUniqueModelMock, distance: 50);
        final sut = model.servicesContacted[0].id;
        const matcher = 4;
        expect(sut, matcher);
        expect(sut, isA<int>());
      },
    );
    test(
      'deve retornar o valor correto para ServicesContractedModel no campo serviceDate',
      () {
        final model =
            UserDataUniqueModel.fromMap(userDataUniqueModelMock, distance: 50);
        final sut = model.servicesContacted[0].serviceDate;
        final matcher = DateTime.parse('9210-06-17 10:40:49.652838');
        expect(sut, matcher);
        expect(sut, isA<DateTime>());
      },
    );
    test(
      'deve retornar o valor correto para ServicesContractedModel no campo serviceDescription',
      () {
        final model =
            UserDataUniqueModel.fromMap(userDataUniqueModelMock, distance: 50);
        final sut = model.servicesContacted[0].serviceDescription;
        const matcher = 'Natoque penatibus et magnis dis.';
        expect(sut, matcher);
        expect(sut, isA<String>());
      },
    );
    test(
      'deve retornar o valor correto para ServicesContractedModel no campo serviceHour',
      () {
        final model =
            UserDataUniqueModel.fromMap(userDataUniqueModelMock, distance: 50);
        final sut = model.servicesContacted[0].serviceHour;
        final matcher = DateTime.parse('4186-10-07 17:59:12.021157');
        expect(sut, matcher);
        expect(sut, isA<DateTime>());
      },
    );
    test(
      'deve retornar o valor correto para ServicesContractedModel no campo serviceProviderId',
      () {
        final model =
            UserDataUniqueModel.fromMap(userDataUniqueModelMock, distance: 50);
        final sut = model.servicesContacted[0].serviceProviderId;
        const matcher = 2;
        expect(sut, matcher);
        expect(sut, isA<int>());
      },
    );
    test(
      'deve retornar o valor correto para ServicesContractedModel no campo servicesToDo',
      () {
        final model =
            UserDataUniqueModel.fromMap(userDataUniqueModelMock, distance: 50);
        final sut = model.servicesContacted[0].servicesToDo;
        const matcher = 'velit';
        expect(sut, matcher);
        expect(sut, isA<String>());
      },
    );
    test(
      'deve retornar o valor correto para ServicesContractedModel no campo status',
      () {
        final model =
            UserDataUniqueModel.fromMap(userDataUniqueModelMock, distance: 50);
        final sut = model.servicesContacted[0].status;
        const matcher = 'ATIVO';
        expect(sut, matcher);
        expect(sut, isA<String>());
      },
    );
    test(
      'deve retornar o valor correto para ServicesContractedModel no campo total',
      () {
        final model =
            UserDataUniqueModel.fromMap(userDataUniqueModelMock, distance: 50);
        final sut = model.servicesContacted[0].total;
        const matcher = '7.463927631927874';
        expect(sut, matcher);
        expect(sut, isA<String>());
      },
    );
    test(
      'deve retornar o valor correto para ServicesContractedModel no campo userComent',
      () {
        final model =
            UserDataUniqueModel.fromMap(userDataUniqueModelMock, distance: 50);
        final sut = model.servicesContacted[0].userComent;
        const matcher =
            'Consectetur a erat nam at lectus urna duis convallis convallis.';
        expect(sut, matcher);
        expect(sut, isA<String>());
      },
    );
    test(
      'deve retornar o valor correto para ServicesContractedModel no campo userFirebasePushToken',
      () {
        final model =
            UserDataUniqueModel.fromMap(userDataUniqueModelMock, distance: 50);
        final sut = model.servicesContacted[0].userFirebasePushToken;
        const matcher = '63[Chv#|';
        expect(sut, matcher);
        expect(sut, isA<String>());
      },
    );
    test(
      'deve retornar o valor correto para ServicesContractedModel no campo userLocationLatitude',
      () {
        final model =
            UserDataUniqueModel.fromMap(userDataUniqueModelMock, distance: 50);
        final sut = model.servicesContacted[0].userLocationLatitude;
        const matcher = 6;
        expect(sut, matcher);
        expect(sut, isA<double>());
      },
    );
    test(
      'deve retornar o valor correto para ServicesContractedModel no campo userLocationaLogintude',
      () {
        final model =
            UserDataUniqueModel.fromMap(userDataUniqueModelMock, distance: 50);
        final sut = model.servicesContacted[0].userLocationaLogintude;
        const matcher = 6;
        expect(sut, matcher);
        expect(sut, isA<double>());
      },
    );
    test(
      'deve retornar o valor correto para ServicesContractedModel no campo userName',
      () {
        final model =
            UserDataUniqueModel.fromMap(userDataUniqueModelMock, distance: 50);
        final sut = model.servicesContacted[0].userName;
        const matcher = 'Selina Hintz';
        expect(sut, matcher);
        expect(sut, isA<String>());
      },
    );
    test(
      'deve retornar o valor correto para ServicesContractedModel no campo userPhotoUrl',
      () {
        final model =
            UserDataUniqueModel.fromMap(userDataUniqueModelMock, distance: 50);
        final sut = model.servicesContacted[0].userPhotoUrl;
        const matcher = 'https://source.unsplash.com/640x480';
        expect(sut, matcher);
        expect(sut, isA<String>());
      },
    );
  });
}
