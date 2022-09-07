import 'package:dartz/dartz.dart';
import '../../../../../exports/app_exports.dart';


abstract class GetServiceProviderUsecase {
Future<Either<ServiceProviderError, List<ServiceProviderEntity>>> call({
    required GetServiceProvidersParams providersParams,
  });
}