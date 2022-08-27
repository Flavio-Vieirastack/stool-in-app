import 'package:dartz/dartz.dart';

import '../../../../../../exports/app_exports.dart';

class GetServiceProviderDataUsecaseImpl implements GetServiceProviderDataUsecase {
  final GetServiceProviderDataRepository _getServiceProviderRepository;
  GetServiceProviderDataUsecaseImpl({
    required GetServiceProviderDataRepository getServiceProviderRepository,
  }) : _getServiceProviderRepository = getServiceProviderRepository;
  @override
  Future<Either<GetServiceProviderError, List<ServiceProviderEntity>>>
      call() async {
    return await _getServiceProviderRepository.call();
  }
}
