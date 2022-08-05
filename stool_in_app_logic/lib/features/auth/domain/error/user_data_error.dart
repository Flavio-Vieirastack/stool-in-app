class UserDataError implements Exception {
  final String message;
  UserDataError({
    required this.message,
  });

  @override
  String toString() => message;
}
