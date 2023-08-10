// import 'dart:html';

// import 'package:flutter_json_placeholder_api/ModelClass.dart';
// import 'package:http/http.dart';

// extension on Response {
//   bool isSuccess() {
//     return statusCode == 200;
//   }

//   bool isCreated() {
//     return statusCode == 201;
//   }

//   bool isError() {
//     return statusCode == 404;
//   }
// }

// abstract class ApiProvider {
//   String baseURL = 'https://jsonplaceholder.typicode.com/';
//   String get ApiURL;
//   Uri getURL({String endpoint = ''}) => Uri.parse(baseURL + ApiURL + endpoint);
//   _fetch() async {
//     Response response = await get(getURL());
//     if (response.isSuccess()) {
//       return 'done';
//     } else {
//       return response.isError();
//     }
//   }
// }

// class ApiAlbum extends ApiProvider {
//   @override
//   // TODO: implement ApiURL
//   String get ApiURL => 'posts';
//   Future<List<ModelClass>> fetchAlbum() async {
//     var list = await _fetch() as List;
//     return list.map((e) => ModelClass.fromMap(e)).toList();
//   }
// }
