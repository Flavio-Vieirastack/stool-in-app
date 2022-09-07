class AuthEntity {
  final String email;
  final String? password;
  final String? firebaseUuid;
  AuthEntity({
    required this.email,
    this.password,
    this.firebaseUuid,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthEntity &&
        other.email == email &&
        other.password == password &&
        other.firebaseUuid == firebaseUuid;
  }

  @override
  int get hashCode =>
      email.hashCode ^ password.hashCode ^ firebaseUuid.hashCode;
}
