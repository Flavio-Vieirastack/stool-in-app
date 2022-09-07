import 'dart:convert';

import '../../domain/entity/services_contracted_entity.dart';


class ServicesContractedModel extends ServicesContractedEntity {
  ServicesContractedModel({
    required super.id,
    required super.serviceDescription,
    required super.serviceDate,
    required super.serviceHour,
    required super.userComent,
    required super.status,
    required super.userName,
    required super.userPhotoUrl,
    required super.userFirebasePushToken,
    required super.userLocationLatitude,
    required super.userLocationaLogintude,
    required super.distance,
    required super.servicesToDo,
    required super.total,
    required super.serviceProviderId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ServicesContractedModel &&
        other.id == id &&
        other.serviceDescription == serviceDescription &&
        other.serviceDate == serviceDate &&
        other.serviceHour == serviceHour &&
        other.userComent == userComent &&
        other.status == status &&
        other.userName == userName &&
        other.userPhotoUrl == userPhotoUrl &&
        other.userFirebasePushToken == userFirebasePushToken &&
        other.userLocationLatitude == userLocationLatitude &&
        other.userLocationaLogintude == userLocationaLogintude &&
        other.distance == distance &&
        other.servicesToDo == servicesToDo &&
        other.total == total &&
        other.serviceProviderId == serviceProviderId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        serviceDescription.hashCode ^
        serviceDate.hashCode ^
        serviceHour.hashCode ^
        userComent.hashCode ^
        status.hashCode ^
        userName.hashCode ^
        userPhotoUrl.hashCode ^
        userFirebasePushToken.hashCode ^
        userLocationLatitude.hashCode ^
        userLocationaLogintude.hashCode ^
        distance.hashCode ^
        servicesToDo.hashCode ^
        total.hashCode ^
        serviceProviderId.hashCode;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'serviceDescription': serviceDescription});
    result.addAll({'serviceDate': serviceDate});
    result.addAll({'serviceHour': serviceHour});
    result.addAll({'userComent': userComent});
    result.addAll({'status': status});
    result.addAll({'userName': userName});
    result.addAll({'userPhotoUrl': userPhotoUrl});
    result.addAll({'userFirebasePushToken': userFirebasePushToken});
    result.addAll({'userLocationLatitude': userLocationLatitude});
    result.addAll({'userLocationaLogintude': userLocationaLogintude});
    result.addAll({'distance': distance});
    result.addAll({'servicesToDo': servicesToDo});
    result.addAll({'total': total});
    result.addAll({'serviceProviderId': serviceProviderId});

    return result;
  }

  factory ServicesContractedModel.fromMap(
    Map<String, dynamic> map, {
    int? distance,
  }) {
    return ServicesContractedModel(
      id: map['id']?.toInt() ?? 0,
      serviceDescription: map['serviceDescription'] ?? '',
      serviceDate: DateTime.parse(map['serviceDate'] ?? ''),
      serviceHour: DateTime.parse(map['serviceHour'] ?? ''),
      userComent: map['userComent'] ?? '',
      status: map['status'] ?? '',
      userName: map['userName'] ?? '',
      userPhotoUrl: map['userPhotoUrl'] ?? '',
      userFirebasePushToken: map['userFirebasePushToken'] ?? '',
      userLocationLatitude: map['userLocationLatitude']?.toDouble() ?? 0.0,
      userLocationaLogintude: map['userLocationaLogintude']?.toDouble() ?? 0.0,
      distance: distance ?? 0,
      servicesToDo: map['servicesToDo'] ?? '',
      total: map['total'] ?? '',
      serviceProviderId: map['serviceProviderId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServicesContractedModel.fromJson(
    String source,
  ) =>
      ServicesContractedModel.fromMap(json.decode(source));
}
