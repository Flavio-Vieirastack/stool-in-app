import 'package:dartz/dartz.dart';

import '../../../export/service_provider_export.dart';


abstract class GetUserServiceTypesRepository {
  Future<Either<GetUserServiceTypesError, List<ServiceTypesReturnEntity>>>
      call({required CreateServiceTypesEntity serviceProviderId});
}
