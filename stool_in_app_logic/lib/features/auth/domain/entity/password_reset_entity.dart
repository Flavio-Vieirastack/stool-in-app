class PasswordResetEntity {
  final String email;
  PasswordResetEntity({
    required this.email,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PasswordResetEntity &&
      other.email == email;
  }

  @override
  int get hashCode => email.hashCode;
}
