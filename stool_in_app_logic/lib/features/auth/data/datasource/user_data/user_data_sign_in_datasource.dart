import 'package:stool_in_app_logic/features/auth/data/model/user_data_model.dart';
import 'package:stool_in_app_logic/features/auth/domain/entity/user_data_entity.dart';

abstract class UserDataSignInDatasource {
  Future<UserDataEntity> sendUserData({required UserDataModel userDataModel});
}
