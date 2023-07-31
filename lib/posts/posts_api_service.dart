import 'package:flutter_json_placeholder_api/posts/posts_api_constants.dart';
import 'package:flutter_json_placeholder_api/posts/posts_data_model.dart';
import 'package:http/http.dart' as http;

class PostsApiService {
  Future<List<PostDataModel>?> getPostsData() async {
    try {
      var url = Uri.parse(
          PostsApiConstants.postBaseUrl + PostsApiConstants.postApiUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<PostDataModel> postDataModelList =
            postDataModelFromJson(response.body);
        return postDataModelList;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
