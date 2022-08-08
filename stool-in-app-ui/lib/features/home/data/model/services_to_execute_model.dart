import 'dart:convert';

import 'package:stool_in_app_ui/features/home/domain/entity/services_to_execute_entity.dart';

class ServicesToExecuteModel extends ServicesToExecuteEntity {
  ServicesToExecuteModel({
    required super.id,
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
    required super.serviceProviderId,
    required super.userDataId,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'serviceDescription': serviceDescription});
    result.addAll({'serviceDate': serviceDate.millisecondsSinceEpoch});
    result.addAll({'serviceHour': serviceHour.millisecondsSinceEpoch});
    result.addAll({'userComent': userComent});
    result.addAll({'status': status});
    result.addAll({'userName': userName});
    result.addAll({'userPhotoUrl': userPhotoUrl});
    result.addAll({'userFirebasePushToken': userFirebasePushToken});
    result.addAll({'userFirebaseUuid': userFirebaseUuid});
    result.addAll({'userLocationLatitude': userLocationLatitude});
    result.addAll({'userLocationLongintude': userLocationLongintude});
    result.addAll({'street': street});
    result.addAll({'city': city});
    result.addAll({'userState': userState});
    result.addAll({'houseNumber': houseNumber});
    result.addAll({'district': district});
    result.addAll({'cep': cep});
    result.addAll({'referencePoint': referencePoint});
    result.addAll({'servicesTodo': servicesTodo});
    result.addAll({'total': total});
    result.addAll({'serviceProviderId': serviceProviderId});
    result.addAll({'userDataId': userDataId});

    return result;
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
      userLocationLongintude: map['userLocationLongintude']?.toDouble() ?? 0.0,
      street: map['street'] ?? '',
      city: map['city'] ?? '',
      userState: map['userState'] ?? '',
      houseNumber: map['houseNumber'] ?? '',
      district: map['district'] ?? '',
      cep: map['cep'] ?? '',
      referencePoint: map['referencePoint'] ?? '',
      servicesTodo: map['servicesTodo'] ?? '',
      total: total ?? 0.0,
      serviceProviderId: map['serviceProviderId']?.toInt() ?? 0,
      userDataId: map['userDataId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServicesToExecuteModel.fromJson(String source) =>
      ServicesToExecuteModel.fromMap(json.decode(source));
}
