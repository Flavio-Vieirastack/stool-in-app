import 'package:dartz/dartz.dart';

import '../../../../../../exports/app_exports.dart';


abstract class GetUserServiceTypesRepository {
  Future<Either<GetUserServiceTypesError, List<ServiceTypesReturnEntity>>>
      call({required CreateServiceTypesEntity serviceProviderId});
}
