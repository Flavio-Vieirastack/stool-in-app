import 'package:stool_in/features/service_provider/domain/entity/service_types/create_service_types_entity.dart';

class ServiceTypesReturnEntity extends CreateServiceTypesEntity {
  final int serviceTypeId;
  ServiceTypesReturnEntity({
    required super.serviceProviderId,
    required this.serviceTypeId,
    super.serviceName,
    super.price,
    super.estimatedHours,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ServiceTypesReturnEntity &&
      other.serviceTypeId == serviceTypeId &&
      other.serviceProviderId == serviceProviderId;
  }

  @override
  int get hashCode => serviceTypeId.hashCode ^ serviceProviderId.hashCode;
}
