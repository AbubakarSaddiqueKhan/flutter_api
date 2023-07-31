// To parse this JSON data, do
//
//     final photosDataModel = photosDataModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<PhotosDataModel> photosDataModelFromJson(String str) =>
    List<PhotosDataModel>.from(
        json.decode(str).map((x) => PhotosDataModel.fromJson(x)));

String photosDataModelToJson(List<PhotosDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotosDataModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  PhotosDataModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  PhotosDataModel copyWith({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) =>
      PhotosDataModel(
        albumId: albumId ?? this.albumId,
        id: id ?? this.id,
        title: title ?? this.title,
        url: url ?? this.url,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      );

  factory PhotosDataModel.fromJson(Map<String, dynamic> json) =>
      PhotosDataModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
