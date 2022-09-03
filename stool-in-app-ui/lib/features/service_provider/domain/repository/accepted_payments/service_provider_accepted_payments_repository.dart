import 'package:dartz/dartz.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/accepted_payments_entity.dart';
import 'package:stool_in/features/service_provider/domain/error/accepted_payments_error.dart';

abstract class ServiceProviderAcceptedPaymentsRepository {
  Future<Either<AcceptedPaymentsError, void>> createAcceptedPayment({
    required int serviceProviderid,
    required AcceptedPaymentsEntity acceptedPaymentsEntity,
  });
  Future<Either<AcceptedPaymentsError, void>> updateAcceptedPayment({
    required int paymentId,
    required AcceptedPaymentsEntity acceptedPaymentsEntity,
  });
  Future<Either<AcceptedPaymentsError, void>> deleteAcceptedPayment({
    required int paymentId,
  });
  Future<Either<AcceptedPaymentsError, AcceptedPaymentsEntity>>
      getAcceptedPaymentUnique({
    required int paymentId,
    required AcceptedPaymentsEntity acceptedPaymentsEntity,
  });
}
