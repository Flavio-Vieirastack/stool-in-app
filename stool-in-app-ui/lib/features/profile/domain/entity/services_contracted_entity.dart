class ServicesContractedEntity {
  final int id;
  final String serviceDescription;
  final String serviceDate;
  final String serviceHour;
  final String userComent;
  final String status;
  final String userName;
  final String userPhotoUrl;
  final String userFirebasePushToken;
  final double userLocationLatitude;
  final double userLocationaLogintude;
  final int distance;
  final String servicesToDo;
  final String total;
  final int serviceProviderId;
  ServicesContractedEntity({
    required this.id,
    required this.serviceDescription,
    required this.serviceDate,
    required this.serviceHour,
    required this.userComent,
    required this.status,
    required this.userName,
    required this.userPhotoUrl,
    required this.userFirebasePushToken,
    required this.userLocationLatitude,
    required this.userLocationaLogintude,
    required this.distance,
    required this.servicesToDo,
    required this.total,
    required this.serviceProviderId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ServicesContractedEntity &&
      other.id == id &&
      other.serviceDescription == serviceDescription &&
      other.serviceDate == serviceDate &&
      other.serviceHour == serviceHour &&
      other.userComent == userComent &&
      other.status == status &&
      other.userName == userName &&
      other.userPhotoUrl == userPhotoUrl &&
      other.userFirebasePushToken == userFirebasePushToken &&
      other.userLocationLatitude == userLocationLatitude &&
      other.userLocationaLogintude == userLocationaLogintude &&
      other.distance == distance &&
      other.servicesToDo == servicesToDo &&
      other.total == total &&
      other.serviceProviderId == serviceProviderId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      serviceDescription.hashCode ^
      serviceDate.hashCode ^
      serviceHour.hashCode ^
      userComent.hashCode ^
      status.hashCode ^
      userName.hashCode ^
      userPhotoUrl.hashCode ^
      userFirebasePushToken.hashCode ^
      userLocationLatitude.hashCode ^
      userLocationaLogintude.hashCode ^
      distance.hashCode ^
      servicesToDo.hashCode ^
      total.hashCode ^
      serviceProviderId.hashCode;
  }
}
