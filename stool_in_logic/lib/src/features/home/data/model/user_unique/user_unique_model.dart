import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

class UserUniqueModel extends UserUniqueEntity {
  UserUniqueModel({
    required super.userData,
    required super.serViceProviders,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserUniqueModel &&
        listEquals(other.userData, userData) &&
        listEquals(other.serViceProviders, serViceProviders);
  }

  @override
  int get hashCode => userData.hashCode ^ serViceProviders.hashCode;

  factory UserUniqueModel.fromMap(Map<String, dynamic> map) {
    return UserUniqueModel(
      userData: List<UserDataModel>.from(
          map['userData']?.map((x) => UserDataModel.fromMap(x))),
      serViceProviders: List<ServiceProviderReturnEntity>.from(
          map['serviceProviders']
              ?.map((x) => ServiceProviderReturnModel.fromMap(x))),
    );
  }

  factory UserUniqueModel.fromJson(String source) =>
      UserUniqueModel.fromMap(json.decode(source));
}
