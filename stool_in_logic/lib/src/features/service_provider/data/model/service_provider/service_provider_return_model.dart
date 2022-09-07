import 'dart:convert';

import '../../../domain/entity/service_provider/service_provider_return_entity.dart';



class ServiceProviderReturnModel extends ServiceProviderReturnEntity {
  ServiceProviderReturnModel({
    required super.id,
    required super.userLoginId,
    required super.createdAt,
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

    return other is ServiceProviderReturnModel &&
        other.id == id &&
        other.userLoginId == userLoginId &&
        other.createdAt == createdAt &&
        other.userDescription == userDescription &&
        other.votes == votes &&
        other.status == status &&
        other.initialDisponibleTime == initialDisponibleTime &&
        other.endDisponibleTime == endDisponibleTime &&
        other.disponibleDays == disponibleDays;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userLoginId.hashCode ^
        createdAt.hashCode ^
        userDescription.hashCode ^
        votes.hashCode ^
        status.hashCode ^
        initialDisponibleTime.hashCode ^
        endDisponibleTime.hashCode ^
        disponibleDays.hashCode;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'userLoginId': userLoginId});
    result.addAll({'createdAt': createdAt});
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
        'initialDisponibleTime': initialDisponibleTime
      });
    }
    if (endDisponibleTime != null) {
      result.addAll(
          {'endDisponibleTime': endDisponibleTime});
    }
    if (disponibleDays != null) {
      result.addAll({'disponibleDays': disponibleDays});
    }

    return result;
  }

  factory ServiceProviderReturnModel.fromMap(Map<String, dynamic> map) {
    return ServiceProviderReturnModel(
      id: map['id']?.toInt() ?? 0,
      userLoginId: map['userLoginId']?.toInt() ?? 0,
      createdAt: DateTime.parse(map['createdAt']),
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

  String toJson() => json.encode(toMap());

  factory ServiceProviderReturnModel.fromJson(String source) =>
      ServiceProviderReturnModel.fromMap(json.decode(source));
}
