import 'package:stool_in_app_ui/features/home/domain/error/service_provider_error.dart';
import 'package:stool_in_app_ui/features/home/domain/entity/service_provider_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in_app_ui/features/home/domain/repository/service_provider_repository.dart';
import 'package:stool_in_app_ui/features/home/domain/usecase/service_provider_usecase.dart';

class ServiceProviderUsecaseImpl implements ServiceProviderUsecase {
  final ServiceProviderRepository _serviceProviderRepository;
  ServiceProviderUsecaseImpl({
    required ServiceProviderRepository serviceProviderRepository,
  }) : _serviceProviderRepository = serviceProviderRepository;
  @override
  Future<Either<ServiceProviderError, List<ServiceProviderEntity>>> call({
    required int pageQuantity,
  }) async {
    return await _serviceProviderRepository.call(pageQuantity: pageQuantity);
  }
}
