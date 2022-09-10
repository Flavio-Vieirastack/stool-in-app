import 'package:stool_in_logic/src/features/home/domain/entity/user_unique/user_unique_entity.dart';

abstract class UserUniqueDatasource {
  Future<UserUniqueEntity> call();
}
