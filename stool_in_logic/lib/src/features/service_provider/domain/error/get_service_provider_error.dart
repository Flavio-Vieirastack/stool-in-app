class GetServiceProviderError implements Exception {
  final String message;
  GetServiceProviderError({required this.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is GetServiceProviderError &&
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => message;
}
