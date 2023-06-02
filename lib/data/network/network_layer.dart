import 'package:dio/dio.dart';

abstract class BaseNetworkLayer {
  Future<dynamic> get(String uri,
      {Map<String, dynamic>? queryParameters, Options? options, headers});

  Future<dynamic> delete(String uri,
      {Map<String, dynamic>? queryParameters, Options? options, headers});

  Future<dynamic> post(String uri,
      {data, Map<String, dynamic>? queryParameters, Options? options});

  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}

class DioClient extends BaseNetworkLayer {
  // dio instance
  final Dio _dio;

  // injecting dio instance
  DioClient(this._dio);

  @override
  Future<dynamic> get(String uri,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      headers}) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // delete:----------------------------------------------------------------------
  @override
  Future<dynamic> delete(String uri,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      headers}) async {
    try {
      final Response response = await _dio.delete(
        uri,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  @override
  Future<dynamic> post(String uri,
      {data, Map<String, dynamic>? queryParameters, Options? options}) async {
    final Response response = await _dio.post(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return response.data;
  }

  // put:----------------------------------------------------------------------
  @override
  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final Response response = await _dio.put(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return response.data;
  }
}
