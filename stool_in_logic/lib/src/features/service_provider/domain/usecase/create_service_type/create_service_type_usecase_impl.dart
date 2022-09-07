

import 'package:dartz/dartz.dart';

import '../../../../../../exports/app_exports.dart';

class CreateServiceTypeUsecaseImpl implements CreateServiceTypeUsecase {
  final CreateServiceTypeRepository _createServiceTypeRepository;
  CreateServiceTypeUsecaseImpl({
    required CreateServiceTypeRepository createServiceTypeRepository,
  }) : _createServiceTypeRepository = createServiceTypeRepository;
  @override
  Future<Either<CreateServiceTypeError, ServiceTypesReturnEntity>> call({
    required CreateServiceTypesEntity createServiceTypesEntity,
  }) async {
    return await _createServiceTypeRepository(
        createServiceTypesEntity: createServiceTypesEntity);
  }
}
