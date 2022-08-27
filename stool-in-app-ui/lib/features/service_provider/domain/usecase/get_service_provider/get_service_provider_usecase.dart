import 'package:dartz/dartz.dart';
import 'package:stool_in/features/service_provider/export/service_provider_export.dart';


abstract class GetServiceProviderUsecase {
  Future<Either<GetServiceProviderError, List<ServiceProviderEntity>>> call();
}
