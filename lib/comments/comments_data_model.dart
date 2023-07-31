// To parse this JSON data, do
//
//     final commentDataModel = commentDataModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CommentDataModel> commentDataModelFromJson(String str) =>
    List<CommentDataModel>.from(
        json.decode(str).map((x) => CommentDataModel.fromJson(x)));

String commentDataModelToJson(List<CommentDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentDataModel {
  int postId;
  int id;
  String name;
  String email;
  String body;

  CommentDataModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  CommentDataModel copyWith({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) =>
      CommentDataModel(
        postId: postId ?? this.postId,
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        body: body ?? this.body,
      );

  factory CommentDataModel.fromJson(Map<String, dynamic> json) =>
      CommentDataModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
