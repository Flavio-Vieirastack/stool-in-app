class FirebaseAuthError implements Exception {
  final String message;
  FirebaseAuthError({
    required this.message,
  });

  @override
  String toString() => message;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is FirebaseAuthError &&
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
