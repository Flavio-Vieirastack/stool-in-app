import 'dart:convert';

import 'package:stool_in_logic/src/features/home/domain/entity/service_provider/services_to_execute_entity.dart';

class ServicesToExecuteModel extends ServicesToExecuteEntity {
  ServicesToExecuteModel({
    super.id,
    required super.serviceDescription,
    required super.serviceDate,
    required super.serviceHour,
    required super.userComent,
    required super.status,
    required super.userName,
    required super.userPhotoUrl,
    required super.userFirebasePushToken,
    required super.userFirebaseUuid,
    required super.userLocationLatitude,
    required super.userLocationLongintude,
    required super.street,
    required super.city,
    required super.userState,
    required super.houseNumber,
    required super.district,
    required super.cep,
    required super.referencePoint,
    required super.servicesTodo,
    required super.total,
    super.serviceProviderId,
    super.userDataId,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (serviceDescription != null) {
      result.addAll({'serviceDescription': serviceDescription});
    }
    if (serviceDate != null) {
      result.addAll({'serviceDate': serviceDate.toString()});
    }
    if (serviceHour != null) {
      result.addAll({'serviceHour': serviceHour.toString()});
    }
    if (userComent != null) {
      result.addAll({'userComent': userComent});
    }
    if (status != null) {
      result.addAll({'status': status});
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
    if (userLocationLongintude != null) {
      result.addAll({'userLocationaLogintude': userLocationLongintude});
    }
    if (street != null) {
      result.addAll({'street': street});
    }
    if (city != null) {
      result.addAll({'City': city});
    }
    if (userState != null) {
      result.addAll({'userState': userState});
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
    if (servicesTodo != null) {
      result.addAll({'servicesToDo': servicesTodo});
    }
    if (total != null) {
      result.addAll({'total': total});
    }

    return result;
  }

  factory ServicesToExecuteModel.fromEntity(
      {required ServicesToExecuteEntity servicesToExecuteEntity}) {
    return ServicesToExecuteModel(
      serviceDescription: servicesToExecuteEntity.serviceDescription,
      serviceDate: servicesToExecuteEntity.serviceDate,
      serviceHour: servicesToExecuteEntity.serviceHour,
      userComent: servicesToExecuteEntity.userComent,
      status: servicesToExecuteEntity.status,
      userName: servicesToExecuteEntity.userName,
      userPhotoUrl: servicesToExecuteEntity.userPhotoUrl,
      userFirebasePushToken: servicesToExecuteEntity.userFirebasePushToken,
      userFirebaseUuid: servicesToExecuteEntity.userFirebaseUuid,
      userLocationLatitude: servicesToExecuteEntity.userLocationLatitude,
      userLocationLongintude: servicesToExecuteEntity.userLocationLongintude,
      street: servicesToExecuteEntity.street,
      city: servicesToExecuteEntity.city,
      userState: servicesToExecuteEntity.userState,
      houseNumber: servicesToExecuteEntity.houseNumber,
      district: servicesToExecuteEntity.district,
      cep: servicesToExecuteEntity.cep,
      referencePoint: servicesToExecuteEntity.referencePoint,
      servicesTodo: servicesToExecuteEntity.servicesTodo,
      total: servicesToExecuteEntity.total,
    );
  }

  factory ServicesToExecuteModel.fromMap(Map<String, dynamic> map) {
    final serviceDate = DateTime.tryParse(map['serviceDate']);
    final serviceHour = DateTime.tryParse(map['serviceHour']);
    final total = double.tryParse(map['total']);
    return ServicesToExecuteModel(
      id: map['id']?.toInt() ?? 0,
      serviceDescription: map['serviceDescription'] ?? '',
      serviceDate: serviceDate ?? DateTime.now(),
      serviceHour: serviceHour ?? DateTime.now(),
      userComent: map['userComent'] ?? '',
      status: map['status'] ?? '',
      userName: map['userName'] ?? '',
      userPhotoUrl: map['userPhotoUrl'] ?? '',
      userFirebasePushToken: map['userFirebasePushToken'] ?? '',
      userFirebaseUuid: map['userFirebaseUuid'] ?? '',
      userLocationLatitude: map['userLocationLatitude']?.toDouble() ?? 0.0,
      userLocationLongintude: map['userLocationaLogintude']?.toDouble() ?? 0.0,
      street: map['street'] ?? '',
      city: map['City'] ?? '',
      userState: map['userState'] ?? '',
      houseNumber: map['houseNumber'] ?? '',
      district: map['district'] ?? '',
      cep: map['cep'] ?? '',
      referencePoint: map['referencePoint'] ?? '',
      servicesTodo: map['servicesToDo'] ?? '',
      total: total ?? 0.0,
      serviceProviderId: map['serviceProviderId']?.toInt() ?? 0,
      userDataId: map['userDataId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServicesToExecuteModel.fromJson(String source) =>
      ServicesToExecuteModel.fromMap(json.decode(source));
}
