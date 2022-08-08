import 'package:stool_in_app_ui/features/home/domain/entity/service_provider_entity.dart';

abstract class ServiceProviderDatasource {
  Future<List<ServiceProviderEntity>> call({required int pageQuantity});
}
