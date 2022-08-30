import 'package:stool_in/features/auth/data/model/user_data_model.dart';
import 'package:stool_in/features/profile/domain/entity/user_data_unique_entity.dart';

abstract class UserDataUniqueDatasource {
  Future<UserDataUniqueEntity> getUserDataUnique();
  Future<void> updateUserData({required UserDataModel userDataModel});
}
