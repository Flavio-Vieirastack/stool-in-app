class RestClientException<T> {
  final T? data;
  final int? statusCode;
  final String? message;
  RestClientException({
    this.data,
    this.statusCode,
    this.message,
  });

  

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RestClientException<T> &&
      other.data == data &&
      other.statusCode == statusCode &&
      other.message == message;
  }

  @override
  int get hashCode => data.hashCode ^ statusCode.hashCode ^ message.hashCode;

  @override
  String toString() => 'RestClientException(data: $data, statusCode: $statusCode, message: $message)';
}
