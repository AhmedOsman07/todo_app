import 'package:dio/dio.dart';

import 'network_layer.dart';

class ApiProvider {
  final DioClient _dioClient =
      DioClient(Dio()..options.headers = {'Content-Type': 'application/json'});

  ApiProvider();

  Future<String> addItem(String? item) {

    return Future.value(item);
  }
}
