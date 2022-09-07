
import 'package:dartz/dartz.dart';
import 'package:stool_in_logic/src/features/profile/domain/usecase/user_data/user_data_unique_usecase.dart';

import '../../../../auth/domain/entity/user_data_entity.dart';
import '../../entity/user_data_unique_entity.dart';
import '../../entity/user_data_unique_location.dart';
import '../../error/update_user_data_error.dart';
import '../../error/user_data_unique_error.dart';
import '../../repository/user_data_unique_repository.dart';


class UserDataUniqueUsecaseImpl implements UserDataUniqueUsecase {
  final UserDataUniqueRepository _userDataUniqueRepository;
  UserDataUniqueUsecaseImpl({
    required UserDataUniqueRepository userDataUniqueRepository,
  }) : _userDataUniqueRepository = userDataUniqueRepository;
  @override
  Future<Either<UserDataUniqueError, UserDataUniqueEntity>> getUserDataUnique(
      {required UserDataUniqueLocation userDataUniqueLocation}) async {
    return await _userDataUniqueRepository.getUserDataUnique(
      userDataUniqueLocation: userDataUniqueLocation,
    );
  }

  @override
  Future<Either<UpdateUserDataError, void>> updateUserData({
    required UserDataEntity userDataEntity,
  }) async {
    return await _userDataUniqueRepository.updateUserData(
        userDataEntity: userDataEntity);
  }
}
