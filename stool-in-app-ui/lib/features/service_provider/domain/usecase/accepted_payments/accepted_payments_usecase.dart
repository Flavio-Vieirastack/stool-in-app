import 'package:dartz/dartz.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/accepted_payments_entity.dart';

import '../../error/accepted_payments_error.dart';

abstract class AcceptedPaymentsUsecase {
Future<Either<AcceptedPaymentsError, void>> createAcceptedPayment({
    required int serviceProviderid,
    required AcceptedPaymentsEntity acceptedPaymentsEntity,
  });
  Future<Either<AcceptedPaymentsError, void>> updateAcceptedPayment({
    required int paymentId,
    required AcceptedPaymentsEntity acceptedPaymentsEntity,
  });
  Future<Either<AcceptedPaymentsError, AcceptedPaymentsEntity>> getAcceptedPaymentUnique({
    required int paymentId,
    required AcceptedPaymentsEntity acceptedPaymentsEntity,
  });
}