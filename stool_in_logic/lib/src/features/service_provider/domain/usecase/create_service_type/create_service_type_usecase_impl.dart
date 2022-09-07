

import 'package:dartz/dartz.dart';

import '../../entity/service_types/create_service_types_entity.dart';
import '../../entity/service_types/service_types_return_entity.dart';
import '../../error/create_service_type_error.dart';
import '../../repository/create_service_type/create_service_type_repository.dart';
import 'create_service_type_usecase.dart';


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
