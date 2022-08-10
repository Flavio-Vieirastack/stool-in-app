

import 'package:stool_in/features/auth/data/model/user_data_model.dart';
import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';

abstract class UserDataSignInDatasource {
  Future<UserDataEntity> sendUserData({required UserDataModel userDataModel});
}
