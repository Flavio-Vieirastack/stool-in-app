


import '../../../export/service_provider_export.dart';

abstract class UpdateServiceProviderDatasource {
  Future<void> call({required CreateAndUpdateServiceProviderModel createAndUpdateServiceProviderModel});
}
