import 'package:dartz/dartz.dart';
import '../../../export/service_provider_export.dart';

abstract class GetUserServiceTyesUseCase {
  Future<Either<GetUserServiceTypesError, List<ServiceTypesReturnEntity>>>
      call({required CreateServiceTypesEntity serviceProviderId});
}
