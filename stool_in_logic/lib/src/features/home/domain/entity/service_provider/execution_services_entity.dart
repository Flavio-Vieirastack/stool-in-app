// Serviços que o prestador executa

class ExecutionServicesEntity {
  final int id;
  final String serviceName;
  final double price;
  final int estimatedHours;
  final int serviceProviderId;
  ExecutionServicesEntity({
    required this.id,
    required this.serviceName,
    required this.price,
    required this.estimatedHours,
    required this.serviceProviderId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ExecutionServicesEntity &&
      other.id == id &&
      other.serviceName == serviceName &&
      other.price == price &&
      other.estimatedHours == estimatedHours &&
      other.serviceProviderId == serviceProviderId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      serviceName.hashCode ^
      price.hashCode ^
      estimatedHours.hashCode ^
      serviceProviderId.hashCode;
  }
}
