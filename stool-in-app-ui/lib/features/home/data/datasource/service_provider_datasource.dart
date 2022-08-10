import 'package:stool_in_app_ui/features/home/domain/entity/service_provider_entity.dart';

import '../../domain/entity/get_service_providers_params.dart';

abstract class ServiceProviderDatasource {
  Future<List<ServiceProviderEntity>> call({required GetServiceProvidersParams providersParams});
}
