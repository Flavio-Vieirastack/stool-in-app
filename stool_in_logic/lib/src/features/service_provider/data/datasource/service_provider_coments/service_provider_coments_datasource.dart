
import '../../../../home/data/model/service_provider/coments_model.dart';
import '../../../../home/domain/entity/service_provider/coments_entity.dart';

abstract class ServiceProviderComentsDatasource {
  Future<void> createComent({
    required ComentsModel comentsModel,
    required int serviceProviderId,
  });
  Future<void> updateComent({
    required ComentsModel comentsModel,
    required int serviceProviderId,
  });
  Future<List<ComentsEntity>> getAllMyComents();
  Future<ComentsEntity> getUniqueComent({
    required int comentId,
  });
  Future<void> deleteComent({
    required int comentId,
  });
}
