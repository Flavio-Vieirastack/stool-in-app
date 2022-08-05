
import 'package:stool_in_app_logic/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in_app_logic/core/rest_client/rest_client_mehods.dart';
import 'package:stool_in_app_logic/core/rest_client/rest_client_response.dart';

class DioRestClientImpl extends RestClientOptions implements DioRestClient {
  final RestClientGet _get;
  final RestClientPost _post;
  final RestClientPut _put;
  final RestClientDelete _delete;
  final RestClientPatch _patch;
  final RestClientRequest _request;
  final RestClientHead _head;
  DioRestClientImpl(
      {required RestClientGet restClientGet,
      required RestClientPost restClientPost,
      required RestClientPut restClientPut,
      required RestClientDelete restClientDelete,
      required RestClientPatch restClientPatch,
      required RestClientRequest restClientRequest,
      required RestClientHead restClientHead})
      : _get = restClientGet,
        _post = restClientPost,
        _put = restClientPut,
        _delete = restClientDelete,
        _patch = restClientPatch,
        _request = restClientRequest,
        _head = restClientHead;

  @override
  DioRestClient auth() {
    baseOptions.extra['auth_required'] = true;
    return this;
  }

  @override
  DioRestClient unauth() {
    baseOptions.extra['auth_required'] = false;
    return this;
  }

  @override
  Future<RestClientResponse<T>> get<T>(
      {required String path,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) {
    return _get.get(path: path, queryParams: queryParams, headers: headers);
  }

  @override
  Future<RestClientResponse<T>> delete<T>(
      {required String path,
      required data,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) {
    return _delete.delete(
        path: path, data: data, queryParams: queryParams, headers: headers);
  }

  @override
  Future<RestClientResponse<T>> patch<T>(
      {required String path,
      required data,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) {
    return _patch.patch(
        path: path, data: data, queryParams: queryParams, headers: headers);
  }

  @override
  Future<RestClientResponse<T>> post<T>(
      {required String path,
      required data,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) {
    return _post.post(
        path: path, data: data, queryParams: queryParams, headers: headers);
  }

  @override
  Future<RestClientResponse<T>> put<T>(
      {required String path,
      required data,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) {
    return _put.put(
        path: path, data: data, queryParams: queryParams, headers: headers);
  }

  @override
  Future<RestClientResponse<T>> request<T>(
      {required String path,
      required data,
      required String method,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) {
    return _request.request(
        path: path,
        data: data,
        method: method,
        queryParams: queryParams,
        headers: headers);
  }

  @override
  Future<RestClientResponse<T>> head<T>(
      {required String path,
      data,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) {
    return _head.head(
      path: path,
      data: data,
      queryParams: queryParams,
      headers: headers,
    );
  }
}