class UserDataEntity {
  final String? userName;
  final String? userPhotoUrl;
  final String? userFirebasePushToken;
  final String? userFirebaseUuid;
  final double? userLocationLatitude;
  final double? userLocationLongitude;
  final String? street;
  final String? city;
  final String? houseNumber;
  final String? district;
  final String? cep;
  final String? referencePoint;
  UserDataEntity({
    this.userName,
    this.userPhotoUrl,
    this.userFirebasePushToken,
    this.userFirebaseUuid,
    this.userLocationLatitude,
    this.userLocationLongitude,
    this.street,
    this.city,
    this.houseNumber,
    this.district,
    this.cep,
    this.referencePoint,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserDataEntity &&
      other.userName == userName &&
      other.userPhotoUrl == userPhotoUrl &&
      other.userFirebasePushToken == userFirebasePushToken &&
      other.userFirebaseUuid == userFirebaseUuid &&
      other.userLocationLatitude == userLocationLatitude &&
      other.userLocationLongitude == userLocationLongitude &&
      other.street == street &&
      other.city == city &&
      other.houseNumber == houseNumber &&
      other.district == district &&
      other.cep == cep &&
      other.referencePoint == referencePoint;
  }

  @override
  int get hashCode {
    return userName.hashCode ^
      userPhotoUrl.hashCode ^
      userFirebasePushToken.hashCode ^
      userFirebaseUuid.hashCode ^
      userLocationLatitude.hashCode ^
      userLocationLongitude.hashCode ^
      street.hashCode ^
      city.hashCode ^
      houseNumber.hashCode ^
      district.hashCode ^
      cep.hashCode ^
      referencePoint.hashCode;
  }
}
