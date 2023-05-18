import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  // dio instance
  final Dio _dio;

  // injecting dio instance
  DioClient(this._dio);

  // Get:-----------------------------------------------------------------------
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
