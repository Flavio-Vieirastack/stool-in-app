class ServicesToExecuteEntity {
  final int id;
  final String serviceDescription;
  final DateTime serviceDate;
  final DateTime serviceHour;
  final String userComent;
  final String status;
  final String userName;
  final String userPhotoUrl;
  final String userFirebasePushToken;
  final String userFirebaseUuid;
  final double userLocationLatitude;
  final double userLocationaLogintude;
  final String street;
  final String city;
  final String houseNumber;
  final String district;
  final String cep;
  final String referencePoint;
  final String servicesToDo;
  final String userState;
  final String total;
  final int serviceProviderId;
  final int userDataId;
  ServicesToExecuteEntity({
    required this.id,
    required this.serviceDescription,
    required this.serviceDate,
    required this.serviceHour,
    required this.userComent,
    required this.status,
    required this.userName,
    required this.userPhotoUrl,
    required this.userFirebasePushToken,
    required this.userFirebaseUuid,
    required this.userLocationLatitude,
    required this.userLocationaLogintude,
    required this.street,
    required this.city,
    required this.houseNumber,
    required this.district,
    required this.cep,
    required this.referencePoint,
    required this.servicesToDo,
    required this.userState,
    required this.total,
    required this.serviceProviderId,
    required this.userDataId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ServicesToExecuteEntity &&
      other.id == id &&
      other.serviceDescription == serviceDescription &&
      other.serviceDate == serviceDate &&
      other.serviceHour == serviceHour &&
      other.userComent == userComent &&
      other.status == status &&
      other.userName == userName &&
      other.userPhotoUrl == userPhotoUrl &&
      other.userFirebasePushToken == userFirebasePushToken &&
      other.userFirebaseUuid == userFirebaseUuid &&
      other.userLocationLatitude == userLocationLatitude &&
      other.userLocationaLogintude == userLocationaLogintude &&
      other.street == street &&
      other.city == city &&
      other.houseNumber == houseNumber &&
      other.district == district &&
      other.cep == cep &&
      other.referencePoint == referencePoint &&
      other.servicesToDo == servicesToDo &&
      other.userState == userState &&
      other.total == total &&
      other.serviceProviderId == serviceProviderId &&
      other.userDataId == userDataId;
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
      userFirebaseUuid.hashCode ^
      userLocationLatitude.hashCode ^
      userLocationaLogintude.hashCode ^
      street.hashCode ^
      city.hashCode ^
      houseNumber.hashCode ^
      district.hashCode ^
      cep.hashCode ^
      referencePoint.hashCode ^
      servicesToDo.hashCode ^
      userState.hashCode ^
      total.hashCode ^
      serviceProviderId.hashCode ^
      userDataId.hashCode;
  }
}
