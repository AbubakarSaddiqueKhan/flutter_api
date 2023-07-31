import 'package:flutter_json_placeholder_api/albums/albums_api_constants.dart';
import 'package:flutter_json_placeholder_api/albums/albums_data_model.dart';
import 'package:http/http.dart' as http;

class AlbumsApiService {
  Future<List<AlbumsDataModel>?> getAlbumsData() async {
    try {
      var url = Uri.parse(
          AlbumsApiConstants.AlbumsBaseUrl + AlbumsApiConstants.AlbumsApiUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<AlbumsDataModel> albumsDataModelList =
            albumsDataModelFromJson(response.body);

        return albumsDataModelList;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
