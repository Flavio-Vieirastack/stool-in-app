import 'dart:convert';

import '../../../domain/entity/service_types/service_types_return_entity.dart';

class ServiceTypeReturnModel extends ServiceTypesReturnEntity {
  ServiceTypeReturnModel({
    required super.serviceTypeId,
    required super.serviceProviderId,
    super.serviceName,
    super.price,
    super.estimatedHours,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ServiceTypeReturnModel &&
        other.serviceTypeId == serviceTypeId &&
        other.serviceProviderId == serviceProviderId &&
        other.serviceName == serviceName &&
        other.price == price &&
        other.estimatedHours == estimatedHours;
  }

  @override
  int get hashCode {
    return serviceTypeId.hashCode ^
        serviceProviderId.hashCode ^
        serviceName.hashCode ^
        price.hashCode ^
        estimatedHours.hashCode;
  }

  factory ServiceTypeReturnModel.fromMap(Map<String, dynamic> map) {
    return ServiceTypeReturnModel(
      serviceTypeId: map['id']?.toInt() ?? 0,
      serviceProviderId: map['serviceProviderId']?.toInt() ?? 0,
      serviceName: map['serviceName'],
      price: double.parse(map['price']),
      estimatedHours: map['estimatedHours']?.toInt(),
    );
  }

  factory ServiceTypeReturnModel.fromJson(String source) =>
      ServiceTypeReturnModel.fromMap(json.decode(source));
}
