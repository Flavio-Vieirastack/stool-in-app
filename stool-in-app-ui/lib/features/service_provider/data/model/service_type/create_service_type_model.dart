

import '../../../export/service_provider_export.dart';

class CreateServiceTypeModel extends CreateServiceTypesEntity {
  CreateServiceTypeModel({
    super.serviceName,
    super.price,
    super.estimatedHours,
    required super.serviceProviderId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateServiceTypeModel &&
        other.serviceName == serviceName &&
        other.price == price &&
        other.estimatedHours == estimatedHours;
  }

  @override
  int get hashCode =>
      serviceName.hashCode ^ price.hashCode ^ estimatedHours.hashCode;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (serviceName != null) {
      result.addAll({'serviceName': serviceName});
    }
    if (price != null) {
      result.addAll({'price': price});
    }
    if (estimatedHours != null) {
      result.addAll({'estimatedHours': estimatedHours});
    }

    return result;
  }

  factory CreateServiceTypeModel.fromEntity(
      {required CreateServiceTypesEntity createServiceTypesEntity}) {
    return CreateServiceTypeModel(
      estimatedHours: createServiceTypesEntity.estimatedHours,
      price: createServiceTypesEntity.price,
      serviceName: createServiceTypesEntity.serviceName,
      serviceProviderId: createServiceTypesEntity.serviceProviderId,
    );
  }
}
