import 'package:flutter_json_placeholder_api/users/users_api_constants.dart';
import 'package:flutter_json_placeholder_api/users/user_data_model.dart';
import 'package:http/http.dart' as http;

class UsersApiService {
  Future<List<UserDataModel>?> getUsers() async {
    try {
      var url = Uri.parse(
          UsersApiConstants.userBaseUrl + UsersApiConstants.userApiUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserDataModel> userDataModelList =
            userDataModelFromJson(response.body);
        return userDataModelList;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
