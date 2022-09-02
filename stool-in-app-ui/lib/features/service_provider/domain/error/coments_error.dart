class ComentsError implements Exception {
  final String message;
  ComentsError({
    required this.message,
  });
  

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ComentsError &&
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => message;
}
