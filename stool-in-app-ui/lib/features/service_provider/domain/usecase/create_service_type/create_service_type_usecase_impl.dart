import 'package:stool_in/features/service_provider/domain/error/create_service_type_error.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/service_types_return_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/features/service_provider/domain/repository/create_service_type/create_service_type_repository.dart';
import 'package:stool_in/features/service_provider/domain/usecase/create_service_type/create_service_type_usecase.dart';

import '../../entity/service_types/create_service_types_entity.dart';

class CreateServiceTypeUsecaseImpl implements CreateServiceTypeUsecase {
  final CreateServiceTypeRepository _createServiceTypeRepository;
  CreateServiceTypeUsecaseImpl({
    required CreateServiceTypeRepository createServiceTypeRepository,
  }) : _createServiceTypeRepository = createServiceTypeRepository;
  @override
  Future<Either<CreateServiceTypeError, ServiceTypesReturnEntity>> call({
    required CreateServiceTypesEntity createServiceTypesEntity,
  }) async {
    return await _createServiceTypeRepository.call(
        createServiceTypesEntity: createServiceTypesEntity);
  }
}
