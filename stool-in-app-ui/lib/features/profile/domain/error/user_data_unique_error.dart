class UserDataUniqueError implements Exception {
  final String message;
  UserDataUniqueError({required this.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserDataUniqueError &&
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => message;
}
