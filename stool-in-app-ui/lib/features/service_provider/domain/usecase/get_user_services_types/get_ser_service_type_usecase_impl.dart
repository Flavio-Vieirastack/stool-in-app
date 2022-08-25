import 'package:stool_in/features/service_provider/domain/error/get_user_service_types_error.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/service_types_return_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/features/service_provider/domain/repository/get_user_service_types/get_user_service_types_repository.dart';
import 'package:stool_in/features/service_provider/domain/usecase/get_user_services_types/get_user_service_tyes_usecase.dart';

import '../../entity/service_types/create_service_types_entity.dart';

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
    return await _getUserServiceTypesRepository.call(
      serviceProviderId: serviceProviderId,
    );
  }
}
