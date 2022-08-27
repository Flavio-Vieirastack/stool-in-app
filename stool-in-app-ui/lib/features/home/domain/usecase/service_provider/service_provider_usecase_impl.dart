import '../../../../../exports/app_exports.dart';
import 'package:dartz/dartz.dart';



class GetServiceProviderUsecaseImpl implements GetServiceProviderUsecase {
  final GetServiceProviderRepository _serviceProviderRepository;
  GetServiceProviderUsecaseImpl({
    required GetServiceProviderRepository serviceProviderRepository,
  }) : _serviceProviderRepository = serviceProviderRepository;
  @override
  Future<Either<ServiceProviderError, List<ServiceProviderEntity>>> call({
    required GetServiceProvidersParams providersParams
  }) async {
    return await _serviceProviderRepository.call(providersParams: providersParams);
  }
}
