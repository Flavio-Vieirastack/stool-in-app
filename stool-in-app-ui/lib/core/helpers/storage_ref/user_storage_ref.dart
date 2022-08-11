import 'package:stool_in/core/constants/keys_constants.dart';
import 'package:stool_in/core/helpers/secure_storage_helper/secure_storage_contracts.dart';

class UserStorageRef {
  final ReadLocalSecurityStorage _readLocalSecurityStorage;
  UserStorageRef({
    required ReadLocalSecurityStorage readLocalSecurityStorage,
  }) : _readLocalSecurityStorage = readLocalSecurityStorage;
  Future<String> getRef() async {
    final userUuid = await _readLocalSecurityStorage.read(
      key: KeysConstants.userFirebaseToken,
    );
    final ref = 'image/profile-$userUuid.jpg';
    return ref;
  }
}
