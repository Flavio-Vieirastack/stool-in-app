
class DeleteServiceTypeError implements Exception {
  final String message;
  DeleteServiceTypeError({
    required this.message,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DeleteServiceTypeError &&
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => message;
}
