import 'dart:convert';

import 'package:flutter_json_placeholder_api/albums/albums_data_model.dart';
import 'package:flutter_json_placeholder_api/comments/comments_data_model.dart';
import 'package:flutter_json_placeholder_api/photos/photos_data_model.dart';
import 'package:http/http.dart';

extension ApiResponse on Response {
  bool isSuccessfulll() => statusCode == 200;
  bool isCreated() => statusCode == 201;
}

abstract class ApiProvider {
  final bassUrl = 'https://jsonplaceholder.typicode.com';
  String get ApiURl;

  Uri getUrl({String endPoint = ""}) => Uri.parse(bassUrl + ApiURl + endPoint);

  _fetch({String endPoint = ""}) async {
    Response response = await get(getUrl(endPoint: endPoint));
    if (response.isSuccessfulll()) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  _insert(Map<String, dynamic> map) async {
    Response response = await post(getUrl(), body: jsonEncode(map));
    return response.isCreated();
  }

  _update({required Map<String, dynamic> map, required String endPoint}) async {
    Response response =
        await put(getUrl(endPoint: endPoint), body: jsonEncode(map));
    return response.isSuccessfulll();
  }

  _delete({required String endPoint}) async {
    Response response = await delete(getUrl(endPoint: endPoint));
    return response.isSuccessfulll();
  }
}

class AlbumApiProvider extends ApiProvider {
  @override
  // TODO: implement ApiURl
  String get ApiURl => "/albums";

  Future<AlbumsDataModel> fetchOnlyOneAlbum(String endPoint) async {
    var map = await _fetch(endPoint: endPoint);
    return AlbumsDataModel.fromJson(map);
  }

  Future<List<AlbumsDataModel>> fetchAlbumsData() async {
    var mapsList = await _fetch() as List;
    return mapsList.map((map) => AlbumsDataModel.fromMap(map)).toList();
  }

  Future<bool> insertNewAlbum(AlbumsDataModel albumsDataModel) async {
    return await _insert(albumsDataModel.toMap());
  }

  Future<bool> updateExistingAlbum(
      AlbumsDataModel albumsDataModel, String endPoint) async {
    return await _update(map: albumsDataModel.toMap(), endPoint: endPoint);
  }

  Future<bool> deleteExistingAlbum(
      AlbumsDataModel albumsDataModel, String endPoint) async {
    return await _delete(endPoint: endPoint);
  }
}

class CommentsApiProver extends ApiProvider {
  @override
  // TODO: implement ApiURl
  String get ApiURl => "/comments";

  Future<CommentDataModel> fetchOnlyOneComment(String endPoint) async {
    var map = await _fetch(endPoint: endPoint);
    return CommentDataModel.fromJson(map);
  }

  Future<List<CommentDataModel>> getAllCommentsData() async {
    List mapsList = await _fetch() as List;
    return mapsList.map((map) => CommentDataModel.fromMap(map)).toList();
  }

  Future<bool> updateExistingComment(
      CommentDataModel commentDataModel, String endPoint) async {
    return _update(map: commentDataModel.toMap(), endPoint: endPoint);
  }

  Future<bool> insertNewComment(AlbumsDataModel albumsDataModel) async {
    return _insert(albumsDataModel.toMap());
  }

  Future<bool> deleteExistingComment(String endPoint) async {
    return _delete(endPoint: endPoint);
  }
}

class PhotosApiProvider extends ApiProvider {
  @override
  // TODO: implement ApiURl
  String get ApiURl => "/photos";

  Future<PhotosDataModel> fetchOnlyOnePhoto(String endPoint) async {
    var map = await _fetch(endPoint: endPoint);
    return PhotosDataModel.fromJson(map);
  }

  Future<List<PhotosDataModel>> fetchAllPhotos() async {
    List photosList = await _fetch() as List<PhotosDataModel>;
    return photosList.map((map) => PhotosDataModel.fromJson(map)).toList();
  }

  Future<bool> updateExistingPhoto(
      PhotosDataModel photosDataModel, String endPoint) async {
    return _update(map: photosDataModel.toMap(), endPoint: endPoint);
  }

  Future<bool> insertNewPhoto(PhotosDataModel photosDataModel) async {
    return _insert(photosDataModel.toMap());
  }

  Future<bool> deleteExistingPhoto(String endPoint) async {
    return _delete(endPoint: endPoint);
  }
}
