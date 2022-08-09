class RestClientException<T> {
  final T? data;
  final int? statusCode;
  RestClientException({
    this.data,
    this.statusCode,
  });

  @override
  String toString() =>
      'RestClientException(data: $data, statusCode: $statusCode,)';
}
