import 'dart:convert';

import 'package:stool_in/features/service_provider/domain/entity/service_provider/create_and_update_service_provider_entity.dart';

class CreateAndUpdateServiceProviderModel
    extends CreateAndUpdateServiceProviderEntity {
  CreateAndUpdateServiceProviderModel({
    super.userDescription,
    super.votes,
    super.status,
    super.initialDisponibleTime,
    super.endDisponibleTime,
    super.disponibleDays,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateAndUpdateServiceProviderModel &&
        other.userDescription == userDescription &&
        other.votes == votes &&
        other.status == status &&
        other.initialDisponibleTime == initialDisponibleTime &&
        other.endDisponibleTime == endDisponibleTime &&
        other.disponibleDays == disponibleDays;
  }

  @override
  int get hashCode {
    return userDescription.hashCode ^
        votes.hashCode ^
        status.hashCode ^
        initialDisponibleTime.hashCode ^
        endDisponibleTime.hashCode ^
        disponibleDays.hashCode;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (userDescription != null) {
      result.addAll({'userDescription': userDescription});
    }
    if (votes != null) {
      result.addAll({'votes': votes});
    }
    if (status != null) {
      result.addAll({'status': status});
    }
    if (initialDisponibleTime != null) {
      result.addAll({
        'initialDisponibleTime': initialDisponibleTime!
      });
    }
    if (endDisponibleTime != null) {
      result.addAll(
          {'endDisponibleTime': endDisponibleTime!});
    }
    if (disponibleDays != null) {
      result.addAll({'disponibleDays': disponibleDays});
    }

    return result;
  }

  factory CreateAndUpdateServiceProviderModel.fromMap(
      Map<String, dynamic> map) {
    return CreateAndUpdateServiceProviderModel(
      userDescription: map['userDescription'],
      votes: map['votes']?.toInt(),
      status: map['status'],
      initialDisponibleTime: map['initialDisponibleTime'] != null
          ? DateTime.parse(map['initialDisponibleTime'])
          : null,
      endDisponibleTime: map['endDisponibleTime'] != null
          ? DateTime.parse(map['endDisponibleTime'])
          : null,
      disponibleDays: map['disponibleDays'],
    );
  }

  factory CreateAndUpdateServiceProviderModel.fromEntity(
      {required CreateAndUpdateServiceProviderEntity
          createAndUpdateServiceProviderEntity}) {
    return CreateAndUpdateServiceProviderModel(
        disponibleDays: createAndUpdateServiceProviderEntity.disponibleDays,
        endDisponibleTime:
            createAndUpdateServiceProviderEntity.endDisponibleTime,
        initialDisponibleTime:
            createAndUpdateServiceProviderEntity.initialDisponibleTime,
        status: createAndUpdateServiceProviderEntity.status,
        userDescription: createAndUpdateServiceProviderEntity.userDescription,
        votes: createAndUpdateServiceProviderEntity.votes);
  }

  String toJson() => json.encode(toMap());

  factory CreateAndUpdateServiceProviderModel.fromJson(String source) =>
      CreateAndUpdateServiceProviderModel.fromMap(json.decode(source));
}
