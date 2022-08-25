import 'package:dartz/dartz.dart';

import '../../entity/service_types/create_service_types_entity.dart';
import '../../entity/service_types/service_types_return_entity.dart';
import '../../error/get_user_service_types_error.dart';

abstract class GetUserServiceTypesRepository {
  Future<Either<GetUserServiceTypesError, List<ServiceTypesReturnEntity>>>
      call({required CreateServiceTypesEntity serviceProviderId});
}
