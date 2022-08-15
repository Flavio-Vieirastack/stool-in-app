import 'dart:convert';

import 'package:stool_in/features/auth/domain/entity/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    required super.email,
    super.password,
    super.userName,
    super.userPhotoUrl,
    super.userFirebasePushToken,
    super.userFirebaseUuid,
    super.userLocationLatitude,
    super.userLocationLongitude,
    super.street,
    super.city,
    super.houseNumber,
    super.district,
    super.cep,
    super.referencePoint,
    super.userState,
  });

  Map<String, dynamic> toMap({bool isInResetRequest = false}) {
    final result = <String, dynamic>{};

    if (email != null) {
      result.addAll({'email': email});
    }
    if (password != null) {
      result.addAll({'password': password});
    }
    if (userName != null) {
      result.addAll({'userName': userName});
    }
    if (userPhotoUrl != null) {
      result.addAll({'userPhotoUrl': userPhotoUrl});
    }
    if (userFirebasePushToken != null) {
      result.addAll({'userFirebasePushToken': userFirebasePushToken});
    }
    if (userFirebaseUuid != null) {
      result.addAll({'userFirebaseUuid': userFirebaseUuid});
    }
    if (userLocationLatitude != null) {
      result.addAll({'userLocationLatitude': userLocationLatitude});
    }
    if (userLocationLongitude != null) {
      result.addAll({'userLocationaLogintude': userLocationLongitude});
    }
    if (street != null) {
      result.addAll({'street': street});
    }
    if (city != null) {
      result.addAll({'City': city});
    }
    if (houseNumber != null) {
      result.addAll({'houseNumber': houseNumber});
    }
    if (district != null) {
      result.addAll({'district': district});
    }
    if (cep != null) {
      result.addAll({'cep': cep});
    }
    if (referencePoint != null) {
      result.addAll({'referencePoint': referencePoint});
    }
    if (userState != null) {
      result.addAll({'userState': userState});
    }

    return result;
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      email: map['email'],
      password: map['password'],
      userName: map['userName'],
      userPhotoUrl: map['userPhotoUrl'],
      userFirebasePushToken: map['userFirebasePushToken'],
      userFirebaseUuid: map['userFirebaseUuid'],
      userLocationLatitude: map['userLocationLatitude']?.toDouble(),
      userLocationLongitude: map['userLocationaLogintude']?.toDouble(),
      street: map['street'],
      city: map['City'],
      houseNumber: map['houseNumber'],
      district: map['district'],
      cep: map['cep'],
      referencePoint: map['referencePoint'],
      userState: map['userState'],
    );
  }

  factory AuthModel.fromEntity(AuthEntity authEntity) {
    return AuthModel(
      email: authEntity.email,
      cep: authEntity.cep,
      city: authEntity.city,
      district: authEntity.district,
      houseNumber: authEntity.houseNumber,
      password: authEntity.password,
      referencePoint: authEntity.referencePoint,
      street: authEntity.district,
      userFirebasePushToken: authEntity.userFirebasePushToken,
      userFirebaseUuid: authEntity.userFirebaseUuid,
      userLocationLatitude: authEntity.userLocationLatitude,
      userLocationLongitude: authEntity.userLocationLongitude,
      userName: authEntity.userName,
      userPhotoUrl: authEntity.userPhotoUrl,
      userState: authEntity.userState,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source));
}
