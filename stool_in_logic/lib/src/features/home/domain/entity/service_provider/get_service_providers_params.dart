class GetServiceProvidersParams {
  final double currentUserLocationLatitude;
  final double currentUserLocationLongitude;
  GetServiceProvidersParams({
    required this.currentUserLocationLatitude,
    required this.currentUserLocationLongitude,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetServiceProvidersParams &&
        other.currentUserLocationLatitude == currentUserLocationLatitude &&
        other.currentUserLocationLongitude == currentUserLocationLongitude;
  }

  @override
  int get hashCode =>
      currentUserLocationLatitude.hashCode ^
      currentUserLocationLongitude.hashCode;
}
