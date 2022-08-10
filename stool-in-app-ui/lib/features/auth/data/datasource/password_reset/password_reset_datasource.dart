
import 'package:stool_in/features/auth/data/model/auth_model.dart';

abstract class PasswordResetDatasource {
  Future<void> firebasePasswordReset({required AuthModel authModel});
  Future<void> apiPasswordReset({required AuthModel authModel});
}
