import '../../../../../../exports/app_exports.dart';

abstract class UpdateServiceProviderDatasource {
  Future<void> call({required CreateAndUpdateServiceProviderModel createAndUpdateServiceProviderModel});
}
