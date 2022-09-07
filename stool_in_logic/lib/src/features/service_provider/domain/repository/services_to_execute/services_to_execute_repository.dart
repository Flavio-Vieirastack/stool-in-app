import 'package:dartz/dartz.dart';

import '../../../../home/domain/entity/service_provider/services_to_execute_entity.dart';
import '../../error/services_to_execute_error.dart';


abstract class ServicesToExecuteRepository {
  Future<Either<ServicesToExecuteError, void>> createServiceToExecute({
    required ServicesToExecuteEntity servicesToExecuteEntity,
    required int serviceProviderId,
  });
  Future<Either<ServicesToExecuteError, void>> updateServicesToExecute({
    required ServicesToExecuteEntity servicesToExecuteEntity,
    required int serviceToExecuteId,
  });
  Future<Either<ServicesToExecuteError, List<ServicesToExecuteEntity>>>
      getAllServicesToExecute();
  Future<Either<ServicesToExecuteError, ServicesToExecuteEntity>>
      getServicesToExecuteUnique({
    required int serviceToExecuteId,
  });
  Future<Either<ServicesToExecuteError, void>> deleteServiceToExecute({
    required int serviceToExecuteid,
  });
}
