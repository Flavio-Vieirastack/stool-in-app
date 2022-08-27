import 'package:dartz/dartz.dart';
import '../../../export/home_export.dart';


abstract class GetServiceProviderUsecase {
Future<Either<ServiceProviderError, List<ServiceProviderEntity>>> call({
    required GetServiceProvidersParams providersParams,
  });
}