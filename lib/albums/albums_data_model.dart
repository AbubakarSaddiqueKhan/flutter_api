// To parse this JSON data, do
//
//     final albumsDataModel = albumsDataModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<AlbumsDataModel> albumsDataModelFromJson(String str) =>
    List<AlbumsDataModel>.from(
        json.decode(str).map((x) => AlbumsDataModel.fromJson(x)));

String albumsDataModelToJson(List<AlbumsDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumsDataModel {
  int userId;
  int id;
  String title;

  AlbumsDataModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  AlbumsDataModel copyWith({
    int? userId,
    int? id,
    String? title,
  }) =>
      AlbumsDataModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
      );

  factory AlbumsDataModel.fromJson(Map<String, dynamic> json) =>
      AlbumsDataModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}
