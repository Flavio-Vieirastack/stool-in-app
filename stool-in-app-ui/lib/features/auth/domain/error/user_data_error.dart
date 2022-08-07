class UserDataError implements Exception {
  final String message;
  UserDataError({
    required this.message,
  });

  @override
  String toString() => message;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserDataError &&
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
