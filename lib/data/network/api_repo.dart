import 'api_provider.dart';

class Repository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<String> addItem(String? item) {
    return _apiProvider.addItem(item);
  }
}
