class SearchServiceProviderError implements Exception {
  final String message;
  SearchServiceProviderError({required this.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SearchServiceProviderError &&
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => message;
}
