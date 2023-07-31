import 'package:flutter_json_placeholder_api/todos/todo_data_model.dart';
import 'package:flutter_json_placeholder_api/todos/todos_api_constants.dart';
import 'package:http/http.dart' as http;

class TodoApiService {
  Future<List<TodosDataModel>?> getTodosData() async {
    try {
      Uri url =
          Uri.parse(TodoApiConstants.TodoBaseUrl + TodoApiConstants.TodoApiUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<TodosDataModel> todosDataModelList =
            todosDataModelFromJson(response.body);
        return todosDataModelList;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
