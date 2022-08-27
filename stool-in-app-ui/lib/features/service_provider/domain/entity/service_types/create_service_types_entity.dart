class CreateServiceTypesEntity {
  final int serviceProviderId;
  final String? serviceName;
  final double? price;
  final int? estimatedHours;
  CreateServiceTypesEntity({
    required this.serviceProviderId,
    this.serviceName,
    this.price,
    this.estimatedHours,
  });

 

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CreateServiceTypesEntity &&
      other.serviceProviderId == serviceProviderId &&
      other.serviceName == serviceName &&
      other.price == price &&
      other.estimatedHours == estimatedHours;
  }

  @override
  int get hashCode {
    return serviceProviderId.hashCode ^
      serviceName.hashCode ^
      price.hashCode ^
      estimatedHours.hashCode;
  }
}
