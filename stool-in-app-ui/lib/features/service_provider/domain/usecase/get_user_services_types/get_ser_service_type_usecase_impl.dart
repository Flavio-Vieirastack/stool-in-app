import '../../../export/service_provider_export.dart';
import 'package:dartz/dartz.dart';


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
