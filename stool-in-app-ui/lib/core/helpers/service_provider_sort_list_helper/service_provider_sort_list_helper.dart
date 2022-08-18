
import '../../../features/home/domain/entity/service_provider/service_provider_entity.dart';

class ServiceProviderSortListHelper {
  List<ServiceProviderEntity> sortList({
    required List<ServiceProviderEntity> providers,
  }) {
    providers.sort((a, b) => a.distance.compareTo(b.distance));
    return providers;
  }
}
