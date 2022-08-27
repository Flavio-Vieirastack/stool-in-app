import '../../../../../../exports/app_exports.dart';

abstract class GetUserServiceTypesDatasource {
  Future<List<ServiceTypesReturnEntity>> getUserServicesTypes({
    required CreateServiceTypesEntity serviceProviderId,
  });
}
