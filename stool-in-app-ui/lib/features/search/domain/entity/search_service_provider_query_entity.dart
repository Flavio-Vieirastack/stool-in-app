class SearchServiceProviderQueryEntity {
  final String query;
  SearchServiceProviderQueryEntity({
    required this.query,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SearchServiceProviderQueryEntity &&
      other.query == query;
  }

  @override
  int get hashCode => query.hashCode;
}
