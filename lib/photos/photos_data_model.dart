// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final photosDataModel = photosDataModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

// List<PhotosDataModel> photosDataModelFromJson(String str) =>
//     List<PhotosDataModel>.from(
//         json.decode(str).map((x) => PhotosDataModel.fromJson(x)));

// String photosDataModelToJson(List<PhotosDataModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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

  // PhotosDataModel({
  //   required this.albumId,
  //   required this.id,
  //   required this.title,
  //   required this.url,
  //   required this.thumbnailUrl,
  // });

  // PhotosDataModel copyWith({
  //   int? albumId,
  //   int? id,
  //   String? title,
  //   String? url,
  //   String? thumbnailUrl,
  // }) =>
  //     PhotosDataModel(
  //       albumId: albumId ?? this.albumId,
  //       id: id ?? this.id,
  //       title: title ?? this.title,
  //       url: url ?? this.url,
  //       thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
  //     );

  // factory PhotosDataModel.fromJson(Map<String, dynamic> json) =>
  //     PhotosDataModel(
  //       albumId: json["albumId"],
  //       id: json["id"],
  //       title: json["title"],
  //       url: json["url"],
  //       thumbnailUrl: json["thumbnailUrl"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "albumId": albumId,
  //       "id": id,
  //       "title": title,
  //       "url": url,
  //       "thumbnailUrl": thumbnailUrl,
  // };

  PhotosDataModel copyWith({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) {
    return PhotosDataModel(
      albumId: albumId ?? this.albumId,
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory PhotosDataModel.fromMap(Map<String, dynamic> map) {
    return PhotosDataModel(
      albumId: map['albumId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      url: map['url'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PhotosDataModel.fromJson(String source) =>
      PhotosDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PhotosDataModel(albumId: $albumId, id: $id, title: $title, url: $url, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(covariant PhotosDataModel other) {
    if (identical(this, other)) return true;

    return other.albumId == albumId &&
        other.id == id &&
        other.title == title &&
        other.url == url &&
        other.thumbnailUrl == thumbnailUrl;
  }

  @override
  int get hashCode {
    return albumId.hashCode ^
        id.hashCode ^
        title.hashCode ^
        url.hashCode ^
        thumbnailUrl.hashCode;
  }
}
