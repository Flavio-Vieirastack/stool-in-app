import 'package:stool_in/features/service_provider/domain/error/coments_error.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/coments_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/features/service_provider/domain/repository/service_provider_coments/service_provider_coments_repository.dart';
import 'package:stool_in/features/service_provider/domain/usecase/service_provider_coments/service_provider_coments_usecase.dart';

class ServiceProviderComentsUsecaseImpl
    implements ServiceProviderComentsUsecase {
  final ServiceProviderComentsRepository _serviceProviderComentsRepository;
  ServiceProviderComentsUsecaseImpl({
    required ServiceProviderComentsRepository serviceProviderComentsRepository,
  }) : _serviceProviderComentsRepository = serviceProviderComentsRepository;
  @override
  Future<Either<ComentsError, void>> createComent({
    required ComentsEntity comentsEntity,
    required int serviceProviderId,
  }) async {
    return await _serviceProviderComentsRepository.createComent(
      comentsEntity: comentsEntity,
      serviceProviderId: serviceProviderId,
    );
  }

  @override
  Future<Either<ComentsError, void>> deleteComent({
    required int comentId,
  }) async {
    return await _serviceProviderComentsRepository.deleteComent(
      comentId: comentId,
    );
  }

  @override
  Future<Either<ComentsError, List<ComentsEntity>>> getAllMyComents() async {
    return await _serviceProviderComentsRepository.getAllMyComents();
  }

  @override
  Future<Either<ComentsError, ComentsEntity>> getUniqueComent({
    required int comentId,
  }) async {
    return await _serviceProviderComentsRepository.getUniqueComent(
      comentId: comentId,
    );
  }

  @override
  Future<Either<ComentsError, void>> updateComent({
    required ComentsEntity comentsEntity,
    required int serviceProviderId,
  }) async {
    return await _serviceProviderComentsRepository.updateComent(
      comentsEntity: comentsEntity,
      serviceProviderId: serviceProviderId,
    );
  }
}
