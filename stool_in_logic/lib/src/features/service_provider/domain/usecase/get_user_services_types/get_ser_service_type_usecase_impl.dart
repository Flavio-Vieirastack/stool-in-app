import 'package:dartz/dartz.dart';

import '../../entity/service_types/create_service_types_entity.dart';
import '../../entity/service_types/service_types_return_entity.dart';
import '../../error/get_user_service_types_error.dart';
import '../../repository/get_user_service_types/get_user_service_types_repository.dart';
import 'get_user_service_tyes_usecase.dart';


class GetSerServiceTypeUsecaseImpl implements GetUserServiceTyesUseCase {
  final GetUserServiceTypesRepository _getUserServiceTypesRepository;
  GetSerServiceTypeUsecaseImpl({
    required GetUserServiceTypesRepository getUserServiceTypesRepository,
  }) : _getUserServiceTypesRepository = getUserServiceTypesRepository;
  @override
  Future<Either<GetUserServiceTypesError, List<ServiceTypesReturnEntity>>>
      call({
    required CreateServiceTypesEntity serviceProviderId,
  }) async {
    return await _getUserServiceTypesRepository(
      serviceProviderId: serviceProviderId,
    );
  }
}
