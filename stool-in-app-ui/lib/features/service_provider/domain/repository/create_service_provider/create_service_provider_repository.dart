import 'package:dartz/dartz.dart';
import 'package:stool_in/features/service_provider/domain/error/create_service_provider_error.dart';

abstract class CreateServiceProviderRepository {
  Future<Either<CreateServiceProviderError, void>> createServiceProvider();
  Future<Either<CreateServiceProviderError, void>> updateUserData({
    required int serviceProviderId,
  });
}
