
import '../../../../home/data/model/service_provider/services_to_execute_model.dart';
import '../../../../home/domain/entity/service_provider/services_to_execute_entity.dart';

abstract class ServicesToExecuteDatasource {
  Future<void> createServiceToExecute({
    required ServicesToExecuteModel servicesToExecuteModel,
    required int serviceProviderId,
  });
  Future<void> updateServicesToExecute({
    required ServicesToExecuteModel servicesToExecuteModel,
    required int serviceToExecuteId,
  });
  Future<List<ServicesToExecuteEntity>> getAllServicesToExecute();
  Future<ServicesToExecuteEntity> getServicesToExecuteUnique({
    required int serviceToExecuteId,
  });
  Future<void> deleteServiceToExecute({
    required int serviceToExecuteid,
  });
}
