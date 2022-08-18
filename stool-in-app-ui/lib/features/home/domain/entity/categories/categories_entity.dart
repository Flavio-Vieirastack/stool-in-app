class CategoriesEntity {
  final int id;
  final String categoryName;
  final String query;
  CategoriesEntity({
    required this.id,
    required this.categoryName,
    required this.query,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CategoriesEntity &&
      other.id == id &&
      other.categoryName == categoryName &&
      other.query == query;
  }

  @override
  int get hashCode => id.hashCode ^ categoryName.hashCode ^ query.hashCode;
}
