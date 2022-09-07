// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:stool_in_logic/src/features/profile/domain/entity/services_contracted_entity.dart';

import '../../../auth/domain/entity/user_data_entity.dart';

class UserDataUniqueEntity extends UserDataEntity {
  final List<ServicesContractedEntity> servicesContacted;
  UserDataUniqueEntity({
    required this.servicesContacted,
    required super.cep,
    required super.city,
    required super.district,
    required super.houseNumber,
    required super.referencePoint,
    required super.serviceProviderId,
    required super.street,
    required super.userFirebasePushToken,
    required super.userFirebaseUuid,
    required super.userLocationLatitude,
    required super.userLocationLongitude,
    required super.userName,
    required super.userPhotoUrl,
    required super.userState,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return other is UserDataUniqueEntity &&
      listEquals(other.servicesContacted, servicesContacted);
  }

  @override
  int get hashCode => servicesContacted.hashCode;
}
