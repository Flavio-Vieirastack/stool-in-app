import 'package:dartz/dartz.dart';

import '../../../export/service_provider_export.dart';

abstract class GetServiceProviderRepository {
Future<Either<GetServiceProviderError, List<ServiceProviderEntity>>> call();
}