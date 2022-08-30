import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:stool_in/features/profile/data/model/services_contracted_model.dart';
import 'package:stool_in/features/profile/domain/entity/user_data_unique_entity.dart';

class UserDataUniqueModel extends UserDataUniqueEntity {
  final List<ServicesContractedModel> servicesContracted;
  UserDataUniqueModel({
    required this.servicesContracted,
    required super.cep,
    required super.city,
    required super.district,
    required super.houseNumber,
    required super.referencePoint,
    required super.serviceProviderId,
    required super.street,
    required super.userFirebasePushToken,
    required super.userFirebaseUuid,
    required super.userLocationLatitude,
    required super.userLocationLongitude,
    required super.userName,
    required super.userPhotoUrl,
    required super.userState,
  }) : super(servicesContacted: servicesContracted);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is UserDataUniqueModel &&
        listEquals(other.servicesContracted, servicesContracted);
  }

  @override
  int get hashCode => servicesContracted.hashCode;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({
      'servicesContracted': servicesContracted.map((x) => x.toMap()).toList()
    });

    return result;
  }

  factory UserDataUniqueModel.fromMap(Map<String, dynamic> map,
      {int? distance}) {
    return UserDataUniqueModel(
      cep: map['cep'],
      city: map['City'],
      district: map['district'],
      houseNumber: map['houseNumber'],
      referencePoint: map['referencePoint'],
      serviceProviderId: map['serviceProviderId'],
      street: map['street'],
      userFirebasePushToken: map['userFirebasePushToken'],
      userFirebaseUuid: map['userFirebaseUuid'],
      userLocationLatitude: double.parse(map['userLocationLatitude']),
      userLocationLongitude: double.parse(map['userLocationLongitude']),
      userName: map['userName'],
      userPhotoUrl: map['userPhotoUrl'],
      userState: map['userState'],
      servicesContracted: List<ServicesContractedModel>.from(
        map['servicesContracted']?.map(
          (x) => ServicesContractedModel.fromMap(
            x,
            distance: distance,
          ),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataUniqueModel.fromJson(String source) =>
      UserDataUniqueModel.fromMap(json.decode(source));
}
