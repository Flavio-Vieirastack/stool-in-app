
import '../../export/auth_exports.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    required super.email,
    super.password,
    super.firebaseUuid,
  });

  Map<String, dynamic> toMap({bool isInResetRequest = false}) {
    final result = <String, dynamic>{};

    if (isInResetRequest == false) {
      result.addAll({'email': email});
    }
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
