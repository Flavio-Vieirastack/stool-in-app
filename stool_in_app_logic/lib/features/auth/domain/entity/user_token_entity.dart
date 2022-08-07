class UserTokenEntity {
  final String token;
  UserTokenEntity({
    required this.token,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserTokenEntity &&
      other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}
