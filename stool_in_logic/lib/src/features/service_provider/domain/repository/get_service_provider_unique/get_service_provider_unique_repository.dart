import 'package:dartz/dartz.dart';
import 'package:stool_in/features/service_provider/domain/error/get_service_provider_unique_error.dart';

import '../../../../../exports/app_exports.dart';

abstract class GetServiceProviderUniqueRepository {
  Future<Either<GetServiceProviderUniqueError, ServiceProviderEntity>> call({
    required int serviceProviderId,
  });
}
