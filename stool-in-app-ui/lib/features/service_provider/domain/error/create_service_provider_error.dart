class CreateServiceProviderError implements Exception {
  final String message;
  CreateServiceProviderError({
    required this.message,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateServiceProviderError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => message;
}
