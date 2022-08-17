class InfoEntity {
  final int id;
  final String titile;
  final String body;
  InfoEntity({
    required this.id,
    required this.titile,
    required this.body,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is InfoEntity &&
      other.id == id &&
      other.titile == titile &&
      other.body == body;
  }

  @override
  int get hashCode => id.hashCode ^ titile.hashCode ^ body.hashCode;
}
