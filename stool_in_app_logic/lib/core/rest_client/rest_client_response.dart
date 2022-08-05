class RestClientResponse<T> {
  final T? data;
  final int? statucCode;
  final String? statusMessage;
  RestClientResponse({
    this.data,
    this.statucCode,
    this.statusMessage,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RestClientResponse<T> &&
      other.data == data &&
      other.statucCode == statucCode &&
      other.statusMessage == statusMessage;
  }

  @override
  int get hashCode => data.hashCode ^ statucCode.hashCode ^ statusMessage.hashCode;

  @override
  String toString() => 'RestClientResponse(data: $data, statucCode: $statucCode, statusMessage: $statusMessage)';
}