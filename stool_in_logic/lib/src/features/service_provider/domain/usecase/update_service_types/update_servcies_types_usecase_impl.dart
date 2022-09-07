import 'package:dartz/dartz.dart';
import 'package:stool_in_logic/src/features/service_provider/domain/usecase/update_service_types/update_service_types_usecase.dart';

import '../../entity/service_types/create_service_types_entity.dart';
import '../../error/update_service_types_error.dart';
import '../../repository/update_service_types/update_service_types_repository.dart';


class UpdateServciesTypesUsecaseImpl implements UpdateServiceTypesUsecase {
  final UpdateServiceTypesRepository _updateServiceTypesRepository;
  UpdateServciesTypesUsecaseImpl({
    required UpdateServiceTypesRepository updateServiceTypesRepository,
  }) : _updateServiceTypesRepository = updateServiceTypesRepository;

  @override
  Future<Either<UpdateServiceTypesError, void>> call({
    required CreateServiceTypesEntity createServiceTypesEntity,
  }) async {
    return await _updateServiceTypesRepository(
        createServiceTypesEntity: createServiceTypesEntity);
  }
}
