import 'package:dartz/dartz.dart';

import '../../../../../../exports/app_exports.dart';


abstract class UpdateServiceProviderRepository {
  Future<Either<ServiceProviderError, void>> call({
    required CreateAndUpdateServiceProviderEntity
        createAndUpdateServiceProviderEntity,
  });
}
