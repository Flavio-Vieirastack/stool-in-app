class AcceptedPaymentsEntity {
  final int? id;
  final String? payment;
  AcceptedPaymentsEntity({
    this.id,
    this.payment,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AcceptedPaymentsEntity &&
        other.id == id &&
        other.payment == payment;
  }

  @override
  int get hashCode => id.hashCode ^ payment.hashCode;
}
