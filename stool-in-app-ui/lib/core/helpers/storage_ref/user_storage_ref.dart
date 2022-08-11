import 'package:stool_in/core/constants/keys_constants.dart';
import 'package:stool_in/core/helpers/shared_preferences/shared_preferences_helper.dart';

class UserStorageRef with SharedPreferencesHelper {
  Future<String> getRef() async {
    final userUuid = await getString(key: KeysConstants.userFirebaseToken);
    final ref = 'image/profile-$userUuid.jpg';
    return ref;
  }
}
