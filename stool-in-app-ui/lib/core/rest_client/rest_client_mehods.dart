import 'dart:developer';

import 'package:dio/dio.dart';

import 'export/rest_client_export.dart';


class RestClientOptions {
  late Dio dio;
  final baseOptions = BaseOptions(
    baseUrl: 'http://192.168.0.6:3000',
    connectTimeout: 6000,
    receiveTimeout: 6000,
  );
}

class RestClientInitialize extends RestClientOptions {
  RestClientInitialize({BaseOptions? options}) {
    dio = Dio(options ?? baseOptions);
    dio.interceptors.addAll([
      AuthorizationRestClientInterceptor(),
      InternetCheckInterceptor(),
    ]);
  }
}

class RestClientPostImpl extends RestClientInitialize
    implements RestClientPost {
  @override
  Future<RestClientResponse<T>> post<T>(
      {required String path,
      required data,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await dio.post<T>(path,
          data: data,
          queryParameters: queryParams,
          options: Options(headers: headers));

      return RestClientResponse<T>(
        data: response.data,
        statucCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioError catch (e, s) {
      log('Erro ao fazer Post', error: e, stackTrace: s);
      throw RestClientException<T>(
        data: e.response?.data,
        statusCode: e.response?.statusCode,
        message: e.message,
      );
    }
  }
}

class RestClientGetImpl extends RestClientInitialize implements RestClientGet {
  @override
  Future<RestClientResponse<T>> get<T>(
      {required String path,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await dio.get<T>(path,
          queryParameters: queryParams, options: Options(headers: headers));

      return RestClientResponse<T>(
        data: response.data,
        statucCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioError catch (e, s) {
      log('Erro ao fazer Post', error: e, stackTrace: s);
      throw RestClientException<T>(
        data: e.response?.data,
        statusCode: e.response?.statusCode,
        message: e.message,
      );
    }
  }
}

class RestClientPutImpl extends RestClientInitialize implements RestClientPut {
  @override
  Future<RestClientResponse<T>> put<T>(
      {required String path,
      required data,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await dio.put<T>(path,
          data: data,
          queryParameters: queryParams,
          options: Options(headers: headers));

      return RestClientResponse<T>(
        data: response.data,
        statucCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioError catch (e, s) {
      log('Erro ao fazer Post', error: e, stackTrace: s);
      throw RestClientException<T>(
        data: e.response?.data,
        statusCode: e.response?.statusCode,
        message: e.message,
      );
    }
  }
}

class RestClientDeleteImpl extends RestClientInitialize
    implements RestClientDelete {
  @override
  Future<RestClientResponse<T>> delete<T>(
      {required String path,
      data,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await dio.delete<T>(path,
          data: data,
          queryParameters: queryParams,
          options: Options(headers: headers));

      return RestClientResponse<T>(
        data: response.data,
        statucCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioError catch (e, s) {
      log('Erro ao fazer Post', error: e, stackTrace: s);
      throw RestClientException<T>(
        data: e.response?.data,
        statusCode: e.response?.statusCode,
        message: e.message,
      );
    }
  }
}

class RestClientPatchImpl extends RestClientInitialize
    implements RestClientPatch {
  @override
  Future<RestClientResponse<T>> patch<T>(
      {required String path,
      required data,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await dio.patch<T>(path,
          data: data,
          queryParameters: queryParams,
          options: Options(headers: headers));

      return RestClientResponse<T>(
        data: response.data,
        statucCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioError catch (e, s) {
      log('Erro ao fazer Post', error: e, stackTrace: s);
      throw RestClientException<T>(
        data: e.response?.data,
        statusCode: e.response?.statusCode,
        message: e.message,
      );
    }
  }
}

class RestClientResquestImpl extends RestClientInitialize
    implements RestClientRequest {
  @override
  Future<RestClientResponse<T>> request<T>(
      {required String path,
      required data,
      required String method,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await dio.request<T>(path,
          data: data,
          queryParameters: queryParams,
          options: Options(headers: headers));

      return RestClientResponse<T>(
        data: response.data,
        statucCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioError catch (e, s) {
      log('Erro ao fazer Post', error: e, stackTrace: s);
      throw RestClientException<T>(
        data: e.response?.data,
        statusCode: e.response?.statusCode,
        message: e.message,
      );
    }
  }
}
