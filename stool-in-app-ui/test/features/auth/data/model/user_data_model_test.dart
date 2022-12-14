import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

void main() {
  group(
    'ToMap',
    () {
      test('Deve retornar o valor correto para userName', () {
        final faker = Faker();
        final userName = faker.person.name();
        final model = UserDataModel(userName: userName).toMap();
        final sut = model['userName'];
        expect(sut, userName);
        expect(sut, isA<String>());
      });
      test('Deve retornar o valor correto para cep', () {
        final faker = Faker();
        final cep = faker.address.countryCode();
        final model = UserDataModel(cep: cep).toMap();
        final sut = model['cep'];
        expect(sut, cep);
        expect(sut, isA<String>());
      });
      test('Deve retornar o valor correto para cidade', () {
        final faker = Faker();
        final city = faker.address.city();
        final model = UserDataModel(city: city).toMap();
        final sut = model['City'];
        expect(sut, city);
        expect(sut, isA<String>());
      });
      test('Deve retornar o valor correto para bairro', () {
        final faker = Faker();
        final district = faker.address.streetAddress();
        final model = UserDataModel(district: district).toMap();
        final sut = model['district'];
        expect(sut, district);
        expect(sut, isA<String>());
      });
      test('Deve retornar o valor correto para numero da casa', () {
        final faker = Faker();
        final number = faker.address.streetSuffix();
        final model = UserDataModel(houseNumber: number).toMap();
        final sut = model['houseNumber'];
        expect(sut, number);
        expect(sut, isA<String>());
      });
      test('Deve retornar o valor correto para ponto de referencia', () {
        final faker = Faker();
        final referencePoint = faker.address.streetName();
        final model = UserDataModel(referencePoint: referencePoint).toMap();
        final sut = model['referencePoint'];
        expect(sut, referencePoint);
        expect(sut, isA<String>());
      });
      test('Deve retornar o valor correto para rua', () {
        final faker = Faker();
        final street = faker.address.streetName();
        final model = UserDataModel(street: street).toMap();
        final sut = model['street'];
        expect(sut, street);
        expect(sut, isA<String>());
      });
      test('Deve retornar o valor correto para push token', () {
        final faker = Faker();
        final token = faker.randomGenerator.string(8);
        final model = UserDataModel(userFirebasePushToken: token).toMap();
        final sut = model['userFirebasePushToken'];
        expect(sut, token);
        expect(sut, isA<String>());
      });
      test('Deve retornar o valor correto para uuid', () {
        final faker = Faker();
        final uuid = faker.randomGenerator.string(8);
        final model = UserDataModel(userFirebaseUuid: uuid).toMap();
        final sut = model['userFirebaseUuid'];
        expect(sut, uuid);
      });
      test('Deve retornar o valor correto para latitude', () {
        final faker = Faker();
        final latitude = faker.randomGenerator.decimal();
        final model = UserDataModel(userLocationLatitude: latitude).toMap();
        final sut = model['userLocationLatitude'];
        expect(sut, latitude);
        expect(sut, isA<double>());
      });
      test('Deve retornar o valor correto para longitude', () {
        final faker = Faker();
        final longitude = faker.randomGenerator.decimal();
        final model = UserDataModel(userLocationLongitude: longitude).toMap();
        final sut = model['userLocationaLogintude'];
        expect(sut, longitude);
        expect(sut, isA<double>());
      });
      test('Deve retornar o valor correto para image url', () {
        final faker = Faker();
        final url = faker.internet.httpUrl();
        final model = UserDataModel(userPhotoUrl: url).toMap();
        final sut = model['userPhotoUrl'];
        expect(sut, url);
        expect(sut, isA<String>());
      });
    },
  );

  group(
    'fromMap',
    () {
      late Map<String, dynamic> apiMap;
      setUp(
        () {
          apiMap = {
            "userName": "Flavio emerson 5689",
            "userPhotoUrl":
                "https://love.doghero.com.br/wp-content/uploads/2018/12/golden-retriever-1.png",
            "userFirebasePushToken": "push",
            "userFirebaseUuid": "UUid",
            "userLocationLatitude": 2565,
            "userLocationaLogintude": 58741,
            "street": "Rua monsenhor esmeraldo",
            "City": "crato",
            "houseNumber": "255",
            "district": "Pinto madeira",
            "cep": "63101220",
            "referencePoint": "Pr??ximo a x",
            "userState" : "CE"
          };
        },
      );
      test('Deve retornar o tipo correto esperado', () {
        final model = UserDataModel.fromMap(apiMap);
        expect(model, isA<UserDataEntity>());
      });
      test('Deve retornar o valor correto para cep', () {
        final model = UserDataModel.fromMap(apiMap);
        final sut = model.cep;
        expect(sut, '63101220');
        expect(sut, isA<String>());
      });
      test('Deve retornar o valor correto para o estado do usuario', () {
        final model = UserDataModel.fromMap(apiMap);
        final sut = model.userState;
        expect(sut, 'CE');
        expect(sut, isA<String>());
      });
      test('Deve retornar o valor correto para cidade', () {
        final model = UserDataModel.fromMap(apiMap);
        final sut = model.city;
        expect(sut, 'crato');
        expect(sut, isA<String>());
      });
      test('Deve retornar o valor correto para bairro', () {
        final model = UserDataModel.fromMap(apiMap);
        final sut = model.district;
        expect(sut, 'Pinto madeira');
        expect(sut, isA<String>());
      });
      test('Deve retornar o valor correto para numero da casa', () {
        final model = UserDataModel.fromMap(apiMap);
        final sut = model.houseNumber;
        expect(sut, '255');
        expect(sut, isA<String>());
      });
      test('Deve retornar o valor correto para ponto de referencia', () {
        final model = UserDataModel.fromMap(apiMap);
        final sut = model.referencePoint;
        expect(sut, 'Pr??ximo a x');
        expect(sut, isA<String>());
      });
      test('Deve retornar o valor correto para rua', () {
        final model = UserDataModel.fromMap(apiMap);
        final sut = model.street;
        expect(sut, 'Rua monsenhor esmeraldo');
        expect(sut, isA<String>());
      });
      test('Deve retornar o valor correto para token', () {
        final model = UserDataModel.fromMap(apiMap);
        final sut = model.userFirebasePushToken;
        expect(sut, 'push');
        expect(sut, isA<String>());
      });
      test('Deve retornar o valor correto para latitude', () {
        final model = UserDataModel.fromMap(apiMap);
        final sut = model.userLocationLatitude;
        expect(sut, 2565);
        expect(sut, isA<double>());
      });
      test('Deve retornar o valor correto para longintude', () {
        final model = UserDataModel.fromMap(apiMap);
        final sut = model.userLocationLongitude;
        expect(sut, 58741);
        expect(sut, isA<double>());
      });
      test('Deve retornar o valor correto para nome', () {
        final model = UserDataModel.fromMap(apiMap);
        final sut = model.userName;
        expect(sut, 'Flavio emerson 5689');
        expect(sut, isA<String>());
      });
      test('Deve retornar o valor correto para url image', () {
        final model = UserDataModel.fromMap(apiMap);
        final sut = model.userPhotoUrl;
        expect(sut, 'https://love.doghero.com.br/wp-content/uploads/2018/12/golden-retriever-1.png');
        expect(sut, isA<String>());
      });
    },
  );
}
