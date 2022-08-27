class UserLoginEntity {
  final int id;
  UserLoginEntity({
    required this.id,
  });
  

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserLoginEntity &&
      other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
