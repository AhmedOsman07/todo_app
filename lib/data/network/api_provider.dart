import 'package:dio/dio.dart';

import 'network_layer.dart';

class ApiProvider {
  // a getter to make sure we fetch the same instance of object
  static ApiProvider get getInstance {
    if (_instance == null) {
      // if instance is null then init the object and set it to the static object;
      _instance = ApiProvider._();
    }
    //return the instance
    return _instance!;
  }

  ApiProvider._();

  static ApiProvider? _instance;

  // dio client will be inited once as the class will be inited once;
  final DioClient _dioClient =
      DioClient(Dio()..options.headers = {'Content-Type': 'application/json'});

  Future<String> addItem(String? item) {
    //TODO replace with actual api url and jsonbody
    //convert json to model and return future of model
    // _dioClient.post("uri");
    return Future.value(item);
  }

  Future<String> removeItem(String? item) {
    return Future.value(item);
  }

  Future<String> fetchTodoList() {
    //TODO replace with actual api url and jsonbody
    //convert json to model and return future of model
    return Future.value("");
  }
}
