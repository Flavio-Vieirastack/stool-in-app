import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';

class AuthEntity extends UserDataEntity {
  final String? email;
  final String? password;
  AuthEntity({
    required this.email,
    this.password,
    super.cep,
    super.city,
    super.district,
    super.houseNumber,
    super.referencePoint,
    super.street,
    super.userFirebasePushToken,
    super.userFirebaseUuid,
    super.userLocationLatitude,
    super.userLocationLongitude,
    super.userName,
    super.userPhotoUrl,
    super.userState,
  });
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AuthEntity &&
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
