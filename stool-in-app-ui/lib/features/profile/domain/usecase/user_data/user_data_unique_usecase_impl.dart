import 'package:stool_in/features/profile/domain/error/user_data_unique_error.dart';
import 'package:stool_in/features/profile/domain/error/update_user_data_error.dart';
import 'package:stool_in/features/profile/domain/entity/user_data_unique_entity.dart';
import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/features/profile/domain/repository/user_data_unique_repository.dart';
import 'package:stool_in/features/profile/domain/usecase/user_data/user_data_unique_usecase.dart';

class UserDataUniqueUsecaseImpl implements UserDataUniqueUsecase {
  final UserDataUniqueRepository _userDataUniqueRepository;
  UserDataUniqueUsecaseImpl({
    required UserDataUniqueRepository userDataUniqueRepository,
  }) : _userDataUniqueRepository = userDataUniqueRepository;
  @override
  Future<Either<UserDataUniqueError, UserDataUniqueEntity>> getUserDataUnique({
    required double latitude,
    required double longitude,
  }) async {
    return await _userDataUniqueRepository.getUserDataUnique(
      latitude: latitude,
      longitude: longitude,
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
