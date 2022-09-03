import 'package:dartz/dartz.dart';
import 'package:stool_in/features/service_provider/domain/error/accepted_payments_error.dart';

abstract class ServiceProviderAcceptedPaymentsRepository {
  Future<Either<AcceptedPaymentsError, void>> createAcceptedPayment(
      {required int serviceProviderid, });
}
