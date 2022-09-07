
class AceptedPaymentsEntity {
  final int id;
  final String paymenct;
  final int serviceProviderId;
  AceptedPaymentsEntity({
    required this.id,
    required this.paymenct,
    required this.serviceProviderId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AceptedPaymentsEntity &&
      other.id == id &&
      other.paymenct == paymenct &&
      other.serviceProviderId == serviceProviderId;
  }

  @override
  int get hashCode => id.hashCode ^ paymenct.hashCode ^ serviceProviderId.hashCode;
}
