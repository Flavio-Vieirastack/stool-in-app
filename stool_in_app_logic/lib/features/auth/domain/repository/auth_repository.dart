import 'package:stool_in_app_logic/features/auth/domain/entity/auth_entity.dart';

abstract class AuthRepository {
  Future<void> firebaseAuth({required AuthEntity authEntity});
  Future<void> apiAuth({required AuthEntity authEntity});
}
