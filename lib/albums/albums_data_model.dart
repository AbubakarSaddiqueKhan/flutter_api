// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final albumsDataModel = albumsDataModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

// List<AlbumsDataModel> albumsDataModelFromJson(String str) =>
//     List<AlbumsDataModel>.from(
//         json.decode(str).map((x) => AlbumsDataModel.fromJson(x)));

// String albumsDataModelToJson(List<AlbumsDataModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumsDataModel {
  int userId;
  int id;
  String title;
  AlbumsDataModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  // AlbumsDataModel({
  //   required this.userId,
  //   required this.id,
  //   required this.title,
  // });

  // AlbumsDataModel copyWith({
  //   int? userId,
  //   int? id,
  //   String? title,
  // }) =>
  //     AlbumsDataModel(
  //       userId: userId ?? this.userId,
  //       id: id ?? this.id,
  //       title: title ?? this.title,
  //     );

  // factory AlbumsDataModel.fromJson(Map<String, dynamic> json) =>
  //     AlbumsDataModel(
  //       userId: json["userId"],
  //       id: json["id"],
  //       title: json["title"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "userId": userId,
  //       "id": id,
  //       "title": title,
  //     };

  AlbumsDataModel copyWith({
    int? userId,
    int? id,
    String? title,
  }) {
    return AlbumsDataModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
    };
  }

  factory AlbumsDataModel.fromMap(Map<String, dynamic> map) {
    return AlbumsDataModel(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AlbumsDataModel.fromJson(String source) =>
      AlbumsDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AlbumsDataModel(userId: $userId, id: $id, title: $title)';

  @override
  bool operator ==(covariant AlbumsDataModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId && other.id == id && other.title == title;
  }

  @override
  int get hashCode => userId.hashCode ^ id.hashCode ^ title.hashCode;
}
