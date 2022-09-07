class GetServiceProviderUniqueError implements Exception {
  final String message;
  GetServiceProviderUniqueError({required this.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is GetServiceProviderUniqueError &&
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => message;
}
