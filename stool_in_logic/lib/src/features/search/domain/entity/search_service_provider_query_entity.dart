class SearchServiceProviderQueryEntity {
  final String query;
  final String pages;
  SearchServiceProviderQueryEntity({
    required this.query,
    required this.pages,
  });

 

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SearchServiceProviderQueryEntity &&
      other.query == query &&
      other.pages == pages;
  }

  @override
  int get hashCode => query.hashCode ^ pages.hashCode;
}
