import '../../../../../exports/app_exports.dart';

abstract class UserDataSignInDatasource {
  Future<UserDataEntity> sendUserData({required UserDataModel userDataModel});
}
