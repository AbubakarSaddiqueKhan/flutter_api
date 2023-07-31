import 'package:flutter_json_placeholder_api/photos/photos_api_constants.dart';
import 'package:flutter_json_placeholder_api/photos/photos_data_model.dart';
import 'package:http/http.dart' as http;

class PhotosApiService {
  Future<List<PhotosDataModel>?> getPhotoData() async {
    try {
      var url = Uri.parse(
          PhotosApiConstants.PhotosBaseUrl + PhotosApiConstants.PhotosApiUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<PhotosDataModel> photosDataModelList =
            photosDataModelFromJson(response.body);
        return photosDataModelList;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
