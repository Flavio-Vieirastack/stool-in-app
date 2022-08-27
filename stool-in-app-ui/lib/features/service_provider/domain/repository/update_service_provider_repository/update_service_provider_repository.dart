import 'package:dartz/dartz.dart';

import '../../../../home/export/home_export.dart';
import '../../../export/service_provider_export.dart';


abstract class UpdateServiceProviderRepository {
  Future<Either<ServiceProviderError, void>> call({
    required CreateAndUpdateServiceProviderEntity
        createAndUpdateServiceProviderEntity,
  });
}
