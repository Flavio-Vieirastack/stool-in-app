import 'package:dartz/dartz.dart';
import 'package:stool_in/features/service_provider/domain/error/services_to_execute_error.dart';

abstract class ServicesToExecuteRepository {
  Future<Either<ServicesToExecuteError, void>> createServiceToExecute();
}
