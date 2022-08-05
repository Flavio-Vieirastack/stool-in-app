import 'package:stool_in_app_logic/features/auth/data/model/auth_model.dart';

abstract class AuthDatasource {
  Future<void> apiLogin({required AuthModel authModel});
  Future<void> firebaseLogin({required AuthModel authModel});
}
