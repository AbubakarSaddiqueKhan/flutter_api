import 'package:flutter_json_placeholder_api/comments/comments_api_constants.dart';
import 'package:flutter_json_placeholder_api/comments/comments_data_model.dart';
import 'package:http/http.dart' as http;

class CommentApiService {
  Future<List<CommentDataModel>?> getCommentData() async {
    try {
      var url = Uri.parse(CommentsApiConstants.CommentsBaseUrl +
          CommentsApiConstants.CommentsApiUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<CommentDataModel>? commentDataModelList =
            CommentDataModel.fromJson(response.body) as List<CommentDataModel>?;
        return commentDataModelList;
      }
    } catch (e) {
      print(e);
    }
  }
}
