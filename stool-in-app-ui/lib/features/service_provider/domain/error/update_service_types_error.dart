class UpdateServiceTypesError implements Exception {
  final String message;
  UpdateServiceTypesError({
    required this.message,
  });

  @override
  String toString() => message;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UpdateServiceTypesError &&
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
