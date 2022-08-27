

import 'export/rest_client_export.dart';

abstract class DioRestClient extends RestClientOptions {
  DioRestClient auth();
  DioRestClient unauth();
  Future<RestClientResponse<T>> post<T>({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
  Future<RestClientResponse<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
  Future<RestClientResponse<T>> put<T>({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
  Future<RestClientResponse<T>> delete<T>({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
  Future<RestClientResponse<T>> patch<T>({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
  Future<RestClientResponse<T>> head<T>({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
  Future<RestClientResponse<T>> request<T>({
    required String path,
    required dynamic data,
    required String method,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
}

abstract class RestClientPost {
  Future<RestClientResponse<T>> post<T>({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
}

abstract class RestClientGet {
  Future<RestClientResponse<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
}

abstract class RestClientPut {
  Future<RestClientResponse<T>> put<T>({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
}

abstract class RestClientDelete {
  Future<RestClientResponse<T>> delete<T>({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
}

abstract class RestClientPatch {
  Future<RestClientResponse<T>> patch<T>({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
}

abstract class RestClientHead {
  Future<RestClientResponse<T>> head<T>({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
}

abstract class RestClientRequest {
  Future<RestClientResponse<T>> request<T>({
    required String path,
    required dynamic data,
    required String method,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
}
