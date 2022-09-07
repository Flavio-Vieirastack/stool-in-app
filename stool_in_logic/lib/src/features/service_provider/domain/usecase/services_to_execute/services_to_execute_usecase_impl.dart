
import 'package:dartz/dartz.dart';
import 'package:stool_in_logic/src/features/service_provider/domain/usecase/services_to_execute/services_to_execute_usecase.dart';

import '../../../../home/domain/entity/service_provider/services_to_execute_entity.dart';
import '../../error/services_to_execute_error.dart';
import '../../repository/services_to_execute/services_to_execute_repository.dart';

class ServicesToExecuteUsecaseImpl implements ServicesToExecuteUsecase {
  final ServicesToExecuteRepository _servicesToExecuteRepository;
  ServicesToExecuteUsecaseImpl({
    required ServicesToExecuteRepository servicesToExecuteRepository,
  }) : _servicesToExecuteRepository = servicesToExecuteRepository;
  @override
  Future<Either<ServicesToExecuteError, void>> createServiceToExecute({
    required ServicesToExecuteEntity servicesToExecuteEntity,
    required int serviceProviderId,
  }) async {
    return await _servicesToExecuteRepository.createServiceToExecute(
      servicesToExecuteEntity: servicesToExecuteEntity,
      serviceProviderId: serviceProviderId,
    );
  }

  @override
  Future<Either<ServicesToExecuteError, void>> deleteServiceToExecute({
    required int serviceToExecuteid,
  }) async {
    return await _servicesToExecuteRepository.deleteServiceToExecute(
      serviceToExecuteid: serviceToExecuteid,
    );
  }

  @override
  Future<Either<ServicesToExecuteError, List<ServicesToExecuteEntity>>>
      getAllServicesToExecute() async {
    return await _servicesToExecuteRepository.getAllServicesToExecute();
  }

  @override
  Future<Either<ServicesToExecuteError, ServicesToExecuteEntity>>
      getServicesToExecuteUnique({
    required int serviceToExecuteId,
  }) async {
    return await _servicesToExecuteRepository.getServicesToExecuteUnique(
      serviceToExecuteId: serviceToExecuteId,
    );
  }

  @override
  Future<Either<ServicesToExecuteError, void>> updateServicesToExecute({
    required ServicesToExecuteEntity servicesToExecuteEntity,
    required int serviceToExecuteId,
  }) async {
    return await _servicesToExecuteRepository.updateServicesToExecute(
      servicesToExecuteEntity: servicesToExecuteEntity,
      serviceToExecuteId: serviceToExecuteId,
    );
  }
}
