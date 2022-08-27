import 'package:dartz/dartz.dart';

import '../../../export/service_provider_export.dart';

class GetServiceProviderUsecaseImpl implements GetServiceProviderUsecase {
  final GetServiceProviderRepository _getServiceProviderRepository;
  GetServiceProviderUsecaseImpl({
    required GetServiceProviderRepository getServiceProviderRepository,
  }) : _getServiceProviderRepository = getServiceProviderRepository;
  @override
  Future<Either<GetServiceProviderError, List<ServiceProviderEntity>>>
      call() async {
    return await _getServiceProviderRepository.call();
  }
}
