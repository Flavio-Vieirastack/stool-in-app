import 'package:stool_in_logic/src/features/home/domain/error/user_unique/user_unique_error.dart';
import 'package:stool_in_logic/src/features/home/domain/entity/user_unique/user_unique_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in_logic/src/features/home/domain/repository/user_unique/user_unique_repository.dart';
import 'package:stool_in_logic/src/features/home/domain/usecase/user_unique/user_unique_usecase.dart';

class UserUniqueUsecaseImpl implements UserUniqueUsecase {
  final UserUniqueRepository _userUniqueRepository;
  UserUniqueUsecaseImpl({
    required UserUniqueRepository userUniqueRepository,
  }) : _userUniqueRepository = userUniqueRepository;
  @override
  Future<Either<UserUniqueError, UserUniqueEntity>> call() async {
    return await _userUniqueRepository.call();
  }
}
