import '../../../../../exports/app_exports.dart';

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
