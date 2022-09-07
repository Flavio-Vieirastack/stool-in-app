
import '../../../domain/entity/user_data_entity.dart';
import '../../model/user_data_model.dart';

abstract class UserDataSignInDatasource {
  Future<UserDataEntity> sendUserData({required UserDataModel userDataModel});
}
