class CategoriesEntity {
  final int id;
  final String categoryName;
  final String searchQuery;
  final String lottieUrl;
  CategoriesEntity({
    required this.id,
    required this.categoryName,
    required this.searchQuery,
    required this.lottieUrl,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoriesEntity &&
        other.id == id &&
        other.categoryName == categoryName &&
        other.searchQuery == searchQuery &&
        other.lottieUrl == lottieUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        categoryName.hashCode ^
        searchQuery.hashCode ^
        lottieUrl.hashCode;
  }
}
