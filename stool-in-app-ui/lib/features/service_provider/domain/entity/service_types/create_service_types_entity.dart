class CreateServiceTypesEntity {
  final String? serviceName;
  final double? price;
  final int? estimatedHours;
  CreateServiceTypesEntity({
    this.serviceName,
    this.price,
    this.estimatedHours,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateServiceTypesEntity &&
        other.serviceName == serviceName &&
        other.price == price &&
        other.estimatedHours == estimatedHours;
  }

  @override
  int get hashCode =>
      serviceName.hashCode ^ price.hashCode ^ estimatedHours.hashCode;
}
