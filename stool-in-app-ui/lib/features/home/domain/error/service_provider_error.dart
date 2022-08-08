class ServiceProviderError implements Exception {
  final String message;
  ServiceProviderError({
    required this.message,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ServiceProviderError &&
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
