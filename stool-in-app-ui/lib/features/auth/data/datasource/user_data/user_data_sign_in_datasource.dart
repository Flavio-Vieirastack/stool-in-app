

import 'package:stool_in_app_ui/features/auth/data/model/user_data_model.dart';
import 'package:stool_in_app_ui/features/auth/domain/entity/user_data_entity.dart';

abstract class UserDataSignInDatasource {
  Future<UserDataEntity> sendUserData({required UserDataModel userDataModel});
}
