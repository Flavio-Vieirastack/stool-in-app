

import 'package:stool_in_app_ui/features/auth/domain/entity/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    required super.email,
    super.password,
    super.firebaseUuid,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    if (password != null) {
      result.addAll({'password': password});
    }
    if (firebaseUuid != null) {
      result.addAll({'firebaseUuid': firebaseUuid});
    }

    return result;
  }

  factory AuthModel.fromEntity(AuthEntity authEntity) {
    return AuthModel(
      email: authEntity.email,
      password: authEntity.password,
      firebaseUuid: authEntity.firebaseUuid,
    );
  }
}
