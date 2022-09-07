import 'dart:convert';

import '../../domain/entity/user_token_entity.dart';



class UserTokenModel extends UserTokenEntity {
  UserTokenModel({
    required super.token,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserTokenModel &&
      other.token == token;
  }

  @override
  int get hashCode => token.hashCode;

  factory UserTokenModel.fromMap(Map<String, dynamic> map) {
    return UserTokenModel(
      token: map['access_token'] ?? '',
    );
  }

  factory UserTokenModel.fromJson(String source) => UserTokenModel.fromMap(json.decode(source));
}
