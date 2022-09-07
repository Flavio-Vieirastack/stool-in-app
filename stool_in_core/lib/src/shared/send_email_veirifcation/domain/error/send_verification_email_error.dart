class SendVerificationEmailError implements Exception {
  final String message;
  SendVerificationEmailError({required this.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SendVerificationEmailError &&
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => message;
}
