

import '../../constants/export/constants_export.dart';
import '../export/helpers_export.dart';

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
