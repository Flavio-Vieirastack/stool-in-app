import 'dart:developer';

import 'package:stool_in/core/constants/endpoint_constants.dart';
import 'package:stool_in/core/rest_client/error/rest_client_exception.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/accepted_payments_entity.dart';
import 'package:stool_in/features/home/data/model/service_provider/accepted_payments_model.dart';
import 'package:stool_in/features/service_provider/data/datasource/accepted_payments/service_provider_accepted_payments_datasource.dart';
import 'package:stool_in/features/service_provider/domain/error/accepted_payments_error.dart';

class ServiceProviderAcceptedPaymentsDatasourceImpl
    implements ServiceProviderAcceptedPaymentsDatasource {
  final RestClientDelete _restClientDelete;
  final RestClientGet _restClientGet;
  final RestClientPost _restClientPost;
  final RestClientPatch _restClientPatch;
  ServiceProviderAcceptedPaymentsDatasourceImpl({
    required RestClientDelete restClientDelete,
    required RestClientPatch restClientPatch,
    required RestClientPost restClientPost,
    required RestClientGet restClientGet,
  })  : _restClientDelete = restClientDelete,
        _restClientGet = restClientGet,
        _restClientPatch = restClientPatch,
        _restClientPost = restClientPost;
  @override
  Future<void> createAcceptedPayment({
    required int serviceProviderid,
    required AcceptedPaymentsModel acceptedPaymentsModel,
  }) async {
    try {
      await _restClientPost.post(
        path: '${EndpointConstants.acceptedPayments}/$serviceProviderid',
        data: acceptedPaymentsModel.toMap(),
      );
    } on RestClientException catch (e, s) {
      log(
        'Erro ao criar pagamento no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw AcceptedPaymentsError(
        message: 'Erro ao criar tipo de pagamento, tente mais tarde',
      );
    } on AcceptedPaymentsError catch (e, s) {
      log(
        'Erro mapeado ao criar pagamento no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw AcceptedPaymentsError(
        message: 'Erro ao criar tipo de pagamento, tente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro não mapeado ao criar pagamento no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw AcceptedPaymentsError(
        message: 'Erro interno ao criar tipo de pagamento, tente mais tarde',
      );
    }
  }

  @override
  Future<void> deleteAcceptedPayment({
    required int paymentId,
  }) async {
    try {
      await _restClientDelete.delete(
        path: '${EndpointConstants.acceptedPayments}/$paymentId',
      );
    } on RestClientException catch (e, s) {
      log(
        'Erro ao deletar pagamento no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw AcceptedPaymentsError(
        message: 'Erro ao deletar pagamento aceito, tente mais tarde',
      );
    } on AcceptedPaymentsError catch (e, s) {
      log(
        'Erro mapeado ao deletar pagamento no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw AcceptedPaymentsError(
        message: 'Erro ao deletar pagamento aceito, tente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro não mapeado ao deletar pagamento no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw AcceptedPaymentsError(
        message: 'Erro interno ao deletar pagamento aceito, tente mais tarde',
      );
    }
  }

  @override
  Future<AcceptedPaymentsEntity> getAcceptedPaymentUnique({
    required int paymentId,
  }) async {
    try {
      final result = await _restClientGet.get(
        path: '${EndpointConstants.acceptedPayments}/$paymentId',
      );
      final data = AcceptedPaymentsModel.fromMap(result.data);
      return data;
    } on RestClientException catch (e, s) {
      log(
        'Erro ao pegar pagamento aceito no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw AcceptedPaymentsError(
        message: 'Erro ao buscar pagamentos aceitos, tente mais tarde',
      );
    } on AcceptedPaymentsError catch (e, s) {
      log(
        'Erro mapeado ao pegar pagamento aceito no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw AcceptedPaymentsError(
        message: 'Erro ao buscar pagamentos aceitos, tente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro não mapeado ao pegar pagamento aceito no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw AcceptedPaymentsError(
        message: 'Erro interno ao buscar pagamentos aceitos, tente mais tarde',
      );
    }
  }

  @override
  Future<void> updateAcceptedPayment({
    required int paymentId,
    required AcceptedPaymentsModel acceptedPaymentsModel,
  }) async {
    try {
      await _restClientPatch.patch(
        path: '${EndpointConstants.acceptedPayments}/$paymentId',
        data: acceptedPaymentsModel.toMap(),
      );
    } on RestClientException catch (e, s) {
      log(
        'Erro ao fazer update de um pagamento aceito no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw AcceptedPaymentsError(
        message: 'Erro ao atualizar pagamento aceito, tente mais tarde',
      );
    } on AcceptedPaymentsError catch (e, s) {
      log(
        'Erro ao fazer update de um pagamento aceito no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw AcceptedPaymentsError(
        message: 'Erro ao atualizar pagamento aceito, tente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro ao fazer update de um pagamento aceito no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw AcceptedPaymentsError(
        message: 'Erro interno ao atualizar pagamento aceito, tente mais tarde',
      );
    }
  }
}
