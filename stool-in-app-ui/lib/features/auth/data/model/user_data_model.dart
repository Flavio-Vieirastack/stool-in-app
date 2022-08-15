import 'dart:convert';

import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';


// class UserDataModel extends UserDataEntity {
//   UserDataModel(
//       {super.userName,
//       super.userPhotoUrl,
//       super.userFirebasePushToken,
//       super.userFirebaseUuid,
//       super.userLocationLatitude,
//       super.userLocationLongitude,
//       super.street,
//       super.city,
//       super.houseNumber,
//       super.district,
//       super.cep,
//       super.referencePoint,
//       super.userState});

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};

//     if (userName != null) {
//       result.addAll({'userName': userName});
//     }
//     if (userPhotoUrl != null) {
//       result.addAll({'userPhotoUrl': userPhotoUrl});
//     }
//     if (userFirebasePushToken != null) {
//       result.addAll({'userFirebasePushToken': userFirebasePushToken});
//     }
//     if (userFirebaseUuid != null) {
//       result.addAll({'userFirebaseUuid': userFirebaseUuid});
//     }
//     if (userLocationLatitude != null) {
//       result.addAll({'userLocationLatitude': userLocationLatitude});
//     }
//     if (userLocationLongitude != null) {
//       result.addAll({'userLocationaLogintude': userLocationLongitude});
//     }
//     if (street != null) {
//       result.addAll({'street': street});
//     }
//     if (city != null) {
//       result.addAll({'City': city});
//     }
//     if (houseNumber != null) {
//       result.addAll({'houseNumber': houseNumber});
//     }
//     if (district != null) {
//       result.addAll({'district': district});
//     }
//     if (cep != null) {
//       result.addAll({'cep': cep});
//     }
//     if (referencePoint != null) {
//       result.addAll({'referencePoint': referencePoint});
//     }
//     if (userState != null) {
//       result.addAll({'userState' : userState});
//     }

//     return result;
//   }

//   factory UserDataModel.fromMap(Map<String, dynamic> map) {
//     return UserDataModel(
//       userName: map['userName'],
//       userPhotoUrl: map['userPhotoUrl'],
//       userFirebasePushToken: map['userFirebasePushToken'],
//       userFirebaseUuid: map['userFirebaseUuid'],
//       userLocationLatitude: map['userLocationLatitude']?.toDouble(),
//       userLocationLongitude: map['userLocationaLogintude']?.toDouble(),
//       street: map['street'],
//       city: map['City'],
//       houseNumber: map['houseNumber'],
//       district: map['district'],
//       cep: map['cep'],
//       referencePoint: map['referencePoint'],
//       userState: map['userState'],
//     );
//   }
//   factory UserDataModel.fromEntity({required UserDataEntity userDataEntity}) {
//     return UserDataModel(
//       cep: userDataEntity.cep,
//       city: userDataEntity.city,
//       district: userDataEntity.district,
//       houseNumber: userDataEntity.houseNumber,
//       referencePoint: userDataEntity.referencePoint,
//       street: userDataEntity.street,
//       userFirebasePushToken: userDataEntity.userFirebasePushToken,
//       userFirebaseUuid: userDataEntity.userFirebaseUuid,
//       userLocationLatitude: userDataEntity.userLocationLatitude,
//       userLocationLongitude: userDataEntity.userLocationLongitude,
//       userName: userDataEntity.userName,
//       userPhotoUrl: userDataEntity.userPhotoUrl,
//       userState: userDataEntity.userState
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory UserDataModel.fromJson(String source) =>
//       UserDataModel.fromMap(json.decode(source));
// }
