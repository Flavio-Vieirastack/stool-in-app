class InfoEntity {
  final int id;
  final String title;
  final String body;
  InfoEntity({
    required this.id,
    required this.title,
    required this.body,
  });

  

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is InfoEntity &&
      other.id == id &&
      other.title == title &&
      other.body == body;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ body.hashCode;

  @override
  String toString() => 'InfoEntity(id: $id, title: $title, body: $body)';
}
