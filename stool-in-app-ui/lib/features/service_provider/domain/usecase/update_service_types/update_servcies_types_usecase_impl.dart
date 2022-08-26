import 'package:dartz/dartz.dart';
import 'package:stool_in/features/service_provider/domain/error/update_service_types_error.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/create_service_types_entity.dart';
import 'package:stool_in/features/service_provider/domain/repository/update_service_types/update_service_types_repository.dart';
import 'package:stool_in/features/service_provider/domain/usecase/update_service_types/update_service_types_usecase.dart';

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
