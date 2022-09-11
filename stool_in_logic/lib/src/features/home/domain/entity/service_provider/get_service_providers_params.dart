class GetServiceProvidersParams {
  final int pageQuantity;
  final double currentUserLocationLatitude;
  final double currentUserLocationLongitude;
  GetServiceProvidersParams({
    required this.pageQuantity,
    required this.currentUserLocationLatitude,
    required this.currentUserLocationLongitude,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is GetServiceProvidersParams &&
      other.pageQuantity == pageQuantity &&
      other.currentUserLocationLatitude == currentUserLocationLatitude &&
      other.currentUserLocationLongitude == currentUserLocationLongitude;
  }

  @override
  int get hashCode => pageQuantity.hashCode ^ currentUserLocationLatitude.hashCode ^ currentUserLocationLongitude.hashCode;
}
