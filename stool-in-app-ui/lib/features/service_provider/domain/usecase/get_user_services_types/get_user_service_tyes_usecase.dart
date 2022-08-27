import 'package:dartz/dartz.dart';
import '../../../../../../exports/app_exports.dart';

abstract class GetUserServiceTyesUseCase {
  Future<Either<GetUserServiceTypesError, List<ServiceTypesReturnEntity>>>
      call({required CreateServiceTypesEntity serviceProviderId});
}
