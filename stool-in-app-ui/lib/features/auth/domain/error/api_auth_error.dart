class ApiAuthError implements Exception {
  final String message;
  ApiAuthError({
    required this.message,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApiAuthError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => message;
}
