class UserUniqueError implements Exception {
  final String error;
  UserUniqueError({
    required this.error,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserUniqueError &&
      other.error == error;
  }

  @override
  int get hashCode => error.hashCode;

  @override
  String toString() => error;
}
