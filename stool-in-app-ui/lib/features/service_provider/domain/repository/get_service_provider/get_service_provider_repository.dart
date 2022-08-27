import 'package:dartz/dartz.dart';

import '../../../../../../exports/app_exports.dart';

abstract class GetServiceProviderRepository {
Future<Either<GetServiceProviderError, List<ServiceProviderEntity>>> call();
}