import 'package:flutter/foundation.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

class UserUniqueEntity {
  final List<UserDataEntity> userData;
  final List<ServiceProviderEntity> serViceProviders;
  UserUniqueEntity({
    required this.userData,
    required this.serViceProviders,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserUniqueEntity &&
      listEquals(other.userData, userData) &&
      listEquals(other.serViceProviders, serViceProviders);
  }

  @override
  int get hashCode => userData.hashCode ^ serViceProviders.hashCode;
}
