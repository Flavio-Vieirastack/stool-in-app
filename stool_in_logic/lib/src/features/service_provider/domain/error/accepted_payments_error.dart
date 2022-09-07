class AcceptedPaymentsError implements Exception {
  final String message;
  AcceptedPaymentsError({required this.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AcceptedPaymentsError &&
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => message;
}
