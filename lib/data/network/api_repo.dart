import 'api_provider.dart';

class Repository {
  // final ApiProvider _apiProvider = ApiProvider();

  Future<String> addItem(String? item) {
    // ApiProvider apiProvider = ApiProvider();
    return ApiProvider.getInstance.addItem(item);
  }

  Future<String> removeItem(String? item) {
    // ApiProvider apiProvider = ApiProvider();
    return ApiProvider.getInstance.removeItem(item);
  }

  Future<String> fetchTodoList() {
    // ApiProvider apiProvider = ApiProvider();
    return ApiProvider.getInstance.fetchTodoList();
  }
}
//
// class SettingsRepo {
//   Future<String> fetchNewApiData() {
//     // ApiProvider apiProvider = ApiProvider();
//     return ApiProvider.getInstance.fetchTodoList();
//   }
// }
