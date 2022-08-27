import 'package:dartz/dartz.dart';

import '../../../../exports/app_exports.dart';

abstract class SearchServiceProviderRepository {
Future<Either<SearchServiceProviderError, List<ServiceProviderEntity>>>
      call({
    required String query,
  });
}